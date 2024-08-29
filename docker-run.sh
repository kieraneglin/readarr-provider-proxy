#!/bin/sh

set -e

# Install deps
echo "\nInstalling JS packages..."
npm install

# Wait for Postgres to become available.
export PGPASSWORD=$(echo $POSTGRES_PASSWORD)
until psql -h $POSTGRES_HOST -U $POSTGRES_USER -c '\q' 2>/dev/null; do
  echo >&2 "Postgres is unavailable - sleeping"
  sleep 1
done
echo "\nPostgres is available: continuing with database setup..."

# TODO: add database setup commands here

# Run the app in development mode
npm run dev
