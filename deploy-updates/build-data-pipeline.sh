#!/bin/bash
set -e

if [ "$1" = "" ]
then
  echo "Usage: $0 <env>"
  exit
fi
ENV=$1


if [ "$2" != "" ]
then
  BRANCH=$2
else
  BRANCH=release
fi

if  [ "$ENV" = "test" ] && [ "$2" == "" ]
then
  BRANCH="test-release"
fi

echo "Building branch '$BRANCH' using environment '$ENV'"

\rm -Rf build/*

ansible localhost -m git -a "repo=git@github.com:Greenstand/treetracker-data-pipeline.git dest=build/treetracker-data-pipeline version=$BRANCH force=yes depth=1" &
ansible localhost -m git -a "repo=git@github.com:Greenstand/treetracker-analysis-pipeline.git dest=build/treetracker-analysis-pipeline version=$BRANCH force=yes depth=1" &

wait

if [ "$ENV" = "prod" ]
then
  cd build/treetracker-data-pipeline/microservice/
#  npm version patch
#  git push --tags origin master
#  git push -f origin master:production
  cd ../../../

  cd build/treetracker-data-pipeline/consumer/
#  npm version patch
#  git push --tags origin master
#  git push -f origin master:production
  cd ../../../
fi

./scripts/package-pipeline.sh $ENV


