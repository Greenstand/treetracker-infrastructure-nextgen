#!/bin/bash
set -e


# Requires npm i -g @loopback/build

if [ "$1" = "" ]
then
  echo "Usage: $0 <env>"
  exit
fi
ENV=$1

\rm -Rf build/*

ansible localhost -m git -a "repo=git@github.com:Greenstand/treetracker-admin.git dest=build/treetracker-admin version=release force=yes depth=1"

if [ "$ENV" = "prod" ]
then
  cd build/treetracker-admin/
#  npm version patch
#  git push --tags origin master
#  git push -f origin master:production
  cd ../../

fi

./scripts/package-admin.sh $ENV


