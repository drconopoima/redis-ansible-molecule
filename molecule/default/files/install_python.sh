#!/bin/sh

command -v python3 >/dev/null 2>&1 && exit 0
command -v python >/dev/null 2>&1 && exit 0

DEB_PACKAGE_NAME='python';
YUM_PACKAGE_NAME='python36';
if [ -n "$(command -v yum)" ]; then
  yum -y update
  yum install -y ${YUM_PACKAGE_NAME};
elif [ -n "$(command -v apt-get)" ]; then
  apt-get -y update
  apt-get install -y ${DEB_PACKAGE_NAME};
else
  >&2 echo "ERROR: Cannot install python on destination"
  exit 1;
fi

