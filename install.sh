#!/bin/bash

BASEPATH=`pwd`
DIST="`hostnamectl | grep 'Transient hostname' | cut -d ':' -f2 | xargs`";

if [ -e "./dist/${DIST}/install.sh" ]
then
  cd "./dist/${DIST}/";
  source "./install.sh";
else
  echo "Dist ${DIST} not found";
fi