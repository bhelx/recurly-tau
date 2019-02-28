<img align="right" width="200" height="200" src="tau.png">

# Tau

This is meant to be a Recurly clone of [Stripe's Sigma](https://stripe.com/us/sigma). It's just an experiment
in building something with the automated-exports API so PLEASE DONT USE IT.

## Architecture

The docker-compose file has two services:
  1. [sqlpad](https://github.com/rickbergfalk/sqlpad)
  2. a postgres database

A third docker image is provided called `ingester`. This is the script that pulls down your exports from Recurly
and puts them into the postgres database.

## Setup Instructions

First startup sqlpad and database in the background. You might get a couple errors (related to python missing) building the sqlpad
image but that is okay. Ignore them.

```
docker-compose up -d
```

After pg has started, create the schema:

```
psql -h 0.0.0.0 -U sqlpad -f schema.sql
```

Build the ingester:

```
docker build ingester/ -t tau_ingester
```

Run the ingester and provide a subdomain and api key as arguments (there is an optional 3rd argument for base_uri):

```
docker run -w /usr/app -i -t --network=tau_tau-net tau_ingester python ./ingest.py elgordo010 f847375fdac642c08af9fb4e640e5201
```
