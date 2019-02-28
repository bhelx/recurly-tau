import recurly
import urllib.request
import functools
from multiprocessing import Process
from mpipe import OrderedStage, Pipeline
import gzip
import os
import sys
import psycopg2

import recurly

recurly.SUBDOMAIN = sys.argv[1]
recurly.API_KEY = sys.argv[2]

# different base url needed for qa
if len(sys.argv) > 3:
    print("Configuring different base uri")
    recurly.BASE_URI = sys.argv[3].replace(recurly.SUBDOMAIN, "%s")
    from urllib.parse import urlparse
    parts = urlparse(recurly.BASE_URI)
    host = '.'.join(parts.netloc.split('.')[-2:])
    recurly.VALID_DOMAINS = (host,)
    # config
    recurly.CA_CERTS_FILE = 'ca-certificates.crt'
else:
    recurly.CA_CERTS_FILE = '/etc/ssl/cert.pem'


DIR = '/var/exports'

def get_export(date_export):
    (date, f) = date_export
    print("Fetching export %s %s" % (date, f.name))
    return (date, f.name, f.get_export(date))

def download_export(date_export):
    (date, name, export) = date_export
    print("Downloading %s" % export.download_url)
    fname = '%s/%s_%s' % (DIR, date, name)
    urllib.request.urlretrieve(export.download_url, fname)
    return fname

def unzip_file(file):
    out_name = file.replace('.gz', '')
    with open(file, 'rb') as inpt:
        with open(out_name, 'wb') as out:
            out.write(gzip.decompress(inpt.read()))
            os.remove(file)
            print("Decompressed %s" % out_name)
            return out_name

def insert_into_db(file):
    print("Inserting into db %s" % file)
    conn = psycopg2.connect("host=tau_postgres_1 dbname=sqlpad user=sqlpad")
    with conn, conn.cursor() as cur:
        table_name = os.path.basename(file)[11:-4]
        if table_name in ['adjustments_created', 'invoices_created',
                          'invoices_summary_created', 'revenue_schedules_created',
                          'transactions_created']:
            with open(file) as f:
                cur.copy_expert("COPY %s FROM STDIN WITH NULL ''\
                                QUOTE '\"' DELIMITER ',' CSV HEADER;" % table_name, file=f)
                print("Persisted %s" % file)
        else:
            print("Skipping %s" % file)

get_export = OrderedStage(get_export, 8)
download = OrderedStage(download_export, 8)
unzip = OrderedStage(unzip_file, 8)
insert = OrderedStage(insert_into_db, 8)
pipe = Pipeline(get_export.link(download.link(unzip.link(insert))))

def enumerate_exports():
    for date in recurly.ExportDate.all(per_page=200):
        print('\nDate: %s\n' % date.date)
        fs = []
        for f in date.export_files():
            pipe.put((date.date, f))
    print("================")
    print("Done Enumerating")
    print("================")

p = Process(target=enumerate_exports)
p.start()
for result in pipe.results():
    print(result)
