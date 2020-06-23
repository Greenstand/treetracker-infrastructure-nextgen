#!/bin/bash
set -e


# Requires npm i -g @loopback/build

if [ "$1" = "" ]
then
  echo "Usage: $0 <env> <branch>"
  exit
fi
ENV=$1

if [ "$2" != "" ]
then
  BRANCH=$2
else
  BRANCH=release
fi

if [ "$ENV" = "dar" ] && [ "$2" == "" ] 
then 
  BRANCH="dar-es-salaam"
fi

echo "Building branch '$BRANCH' using environment '$ENV'"


\rm -Rf build/*

ansible localhost -m git -a "repo=git@github.com:Greenstand/treetracker-web-map.git dest=build/treetracker-web-map version=$BRANCH force=yes depth=1"

if [ "$ENV" = "prod" ]
then
  cd build/treetracker-web-map/
#  npm version patch
#  git push --tags origin master
#  git push -f origin master:production
  cd ../../

fi

./scripts/package-web-map.sh $ENV


