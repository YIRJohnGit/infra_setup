#!/bin/bash

sudo apt install -y wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

sudo apt update
sudo apt install -y postgresql postgresql-contrib


sudo systemctl status postgresql

echo "to Quit postgre cli \q" 
sudo -u postgres psql


