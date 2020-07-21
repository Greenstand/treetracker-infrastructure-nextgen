#!/bin/bash
set -e

source ./scripts/build-arguments.sh

\rm -Rf build/*

ansible localhost -m git -a "repo=git@github.com:Greenstand/treetracker-mobile-api.git dest=build/treetracker-mobile-api version=$BRANCH force=yes depth=1"

if [ "$ENV" = "prod" ]
then
  cd build/treetracker-mobile-api/
#  npm version patch
#  git push --tags origin master
#  git push -f origin master:production
  cd ../../

fi

./scripts/package-mobile-api-legacy.sh $ENV


