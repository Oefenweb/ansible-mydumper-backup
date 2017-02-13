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
echo 'mysql-server-5.5 mysql-server/root_password password vagrant' | debconf-set-selections;
echo 'mysql-server-5.5 mysql-server/root_password_again password vagrant' | debconf-set-selections;
echo 'mysql-server-5.6 mysql-server/root_password password vagrant' | debconf-set-selections;
echo 'mysql-server-5.6 mysql-server/root_password_again password vagrant' | debconf-set-selections;

apt-install mysql-server wget mydumper;

cat << EOF > ~/.my.cnf
[client]
host = 127.0.0.1
user = root
password = vagrant
EOF

# To prevent: ERROR 1214 (HY000) at line 175: The used table type doesn't support FULLTEXT indexes
if [ "$(lsb_release -c -s)" == 'xenial' ]; then
  cd /tmp;
  wget https://downloads.mysql.com/docs/sakila-db.tar.gz;
  tar -xzvf sakila-db.tar.gz;
  mysql < sakila-db/sakila-schema.sql;
  mysql < sakila-db/sakila-data.sql;
fi

touch /provisioned;
