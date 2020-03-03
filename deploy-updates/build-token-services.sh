#!/bin/bash
set -e

if [ "$1" = "" ]
then
  echo "Usage: $0 <env>"
  exit
fi
ENV=$1

\rm -Rf build/*

ansible localhost -m git -a "repo=git@github.com:Greenstand/treetracker-token-trading-api.git dest=build/treetracker-token-api force=yes depth=1"

if [ "$ENV" = "prod" ]
then
  cd build/treetracker-token-api/
#  npm version patch
#  git push --tags origin master
#  git push -f origin master:production
  cd ../../

fi

./scripts/package-token-services.sh $ENV


