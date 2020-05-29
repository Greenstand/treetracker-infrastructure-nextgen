#!/bin/bash
set -e

if [ "$1" = "" ]
then
  echo "Usage: $0 <env>"
  exit
fi
ENV=$1

find ./build/ -name *.spec.js -exec rm {} \;

pwd

cd build/treetracker-token-api/
npm ci &
cd ../../

wait

tar -cvzf build/treetracker-token-api.tar.gz --directory build/treetracker-token-api/ . &

wait

echo "Done"
