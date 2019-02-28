FROM python:3.7.2-alpine3.9

RUN apk update && apk upgrade && \
    apk add --no-cache git postgresql-dev gcc g++ make ca-certificates

WORKDIR /usr/app

COPY . .

RUN pip3 install -r requirements.txt

RUN mkdir /var/exports
