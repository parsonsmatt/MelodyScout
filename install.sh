#! /bin/sh

# This installs the necessary system dependencies for MelodyScout.

## PostgreSQL:
sudo apt-get install postgresql-9.3 postgresql-server-dev-9.3 -y

## Configure database for peer access:
PG_ID=`whoami`
sudo -u postgres createuser -s $PG_ID
createdb MelodyScout_{test,development}
rake db:migrate
rake db:seed
