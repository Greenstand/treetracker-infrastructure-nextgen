#!/bin/bash
set -e

if [ "$1" = "" ]
then
  echo "Usage: $0 <env>"
  exit
fi
ENV=$1

find ./build/treetracker-admin/ -name *.spec.js -exec rm {} \;

#cp ../config/$ENV/treetracker-admin/server/src/datasources/treetracker.datasource.json build/treetracker-admin/server/src/datasources/
#ansible-vault decrypt build/treetracker-admin/server/src/datasources/treetracker.datasource.json
touch build/treetracker-admin/server/src/datasources/treetracker.datasource.json


cd build/treetracker-admin/server
npm i 
npm run-script clean
npm run-script build
cd ../
cd client
npm i 
npm run-script build
cd ../../../


tar -cvzf build/treetracker-admin-api.tar.gz --directory build/treetracker-admin/server/ . &
tar -cvzf build/treetracker-admin-client.tar.gz --directory build/treetracker-admin/client/build/ . &

wait

echo "Done"
