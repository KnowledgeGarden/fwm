#!/usr/bin/env bash

# grabs the given service database
HOST=localhost:9091
NAME=conversation
TOKEN=change-me
http $HOST/db-dump/$NAME \
  dump-db-secret:$TOKEN > $NAME.db
