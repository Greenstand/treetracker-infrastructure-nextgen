#!/bin/bash
set -e

source ./scripts/build-arguments.sh


\rm -Rf build/*

ansible localhost -m git -a "repo=git@github.com:$REPOSITORY.git dest=build/treetracker-web-map version=$BRANCH force=yes depth=1"

if [ "$ENV" = "prod" ]
then
  cd build/treetracker-web-map/
#  npm version patch
#  git push --tags origin master
#  git push -f origin master:production
  cd ../../

fi

./scripts/package-web-map.sh $ENV


