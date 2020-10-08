#!/bin/bash
set -e

if [ "$1" = "" ]
then
  echo "Usage: $0 <env>"
  exit
fi
ENV=$1

find ./build/treetracker-web-map/ -name *.spec.js -exec rm {} \;

cd ./build/treetracker-web-map/client/
npm i
npm run build
cd ../../../

cd build/treetracker-web-map/server
npm i 
cd ../../../


tar -cvzf build/treetracker-web-map-api.tar.gz --directory build/treetracker-web-map/server/ . &
tar -cvzf build/treetracker-web-map-client.tar.gz --directory build/treetracker-web-map/client/build/ . &

wait

echo "Done"
