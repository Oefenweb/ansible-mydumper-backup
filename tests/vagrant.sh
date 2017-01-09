#!/usr/bin/env bash
#
# set -x;
set -e;
set -o pipefail;
#
thisFile="$(readlink -f ${0})";
thisFilePath="$(dirname ${thisFile})";

# Only provision once
if [ -f /provisioned ]; then
  exit 0;
fi

export DEBIAN_FRONTEND=noninteractive;

shopt -s expand_aliases;
alias apt-update='apt-get update -qq';
alias apt-install='apt-get install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"';

apt-update;
apt-install debconf-utils;

echo 'mysql-server mysql-server/root_password password vagrant' | debconf-set-selections;
echo 'mysql-server mysql-server/root_password_again password vagrant' | debconf-set-selections;
echo 'mysql-server-5.1 mysql-server/root_password password vagrant' | debconf-set-selections;
echo 'mysql-server-5.1 mysql-server/root_password_again password vagrant' | debconf-set-selections;
echo 'mysql-server-5.5 mysql-server/root_password password vagrant' | debconf-set-selections;
echo 'mysql-server-5.5 mysql-server/root_password_again password vagrant' | debconf-set-selections;
echo 'mysql-server-5.6 mysql-server/root_password password vagrant' | debconf-set-selections;
echo 'mysql-server-5.6 mysql-server/root_password_again password vagrant' | debconf-set-selections;

apt-install mysql-server;

cat << EOF > ~/.my.cnf
[client]
host = 127.0.0.1
user = root
password = vagrant
EOF

apt-install wget;

# Will fail on Ubuntu 10.04 and Debian 6.0.10
apt-install mydumper || true;

cd /tmp;
wget http://downloads.mysql.com/docs/sakila-db.tar.gz;
tar -xzvf sakila-db.tar.gz;
mysql < sakila-db/sakila-schema.sql;
mysql < sakila-db/sakila-data.sql;

touch /provisioned;
