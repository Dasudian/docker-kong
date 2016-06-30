#!/bin/sh

# Setting up the proper database
if [ -n "$DATABASE" ]; then
  sed -ri "s|^database: .*|database: $DATABASE|" $KONG_CONFIG
fi

if [ -n "$PG_HOST" ]; then
  sed -ri "s|^  host: .*|  host: '$PG_HOST'|" $KONG_CONFIG
fi

if [ -n "$PG_DB" ]; then
  sed -ri "s|^  database: .*|  database: $PG_DB|" $KONG_CONFIG
fi

if [ -n "$PG_USER" ]; then
  sed -ri "s|^  user: .*|  user: $PG_USER|" $KONG_CONFIG
fi

if [ -n "$PG_PASSWD" ]; then
  sed -ri "s|^  password: .*|  password: $PG_PASSWD|" $KONG_CONFIG
fi
