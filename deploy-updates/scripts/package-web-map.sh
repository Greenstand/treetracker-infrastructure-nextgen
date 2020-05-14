#!/bin/bash
set -e

if [ "$1" = "" ]
then
  echo "Usage: $0 <env>"
  exit
fi
ENV=$1

find ./build/treetracker-web-map/ -name *.spec.js -exec rm {} \;

cp ../config/$ENV/treetracker-web-map/client/config.js build/treetracker-web-map/client/js/

cd build/treetracker-web-map/server
npm i 
cd ../../../


tar -cvzf build/treetracker-web-map-api.tar.gz --directory build/treetracker-web-map/server/ . &
tar -cvzf build/treetracker-web-map-client.tar.gz --directory build/treetracker-web-map/client/ . &

wait

echo "Done"
