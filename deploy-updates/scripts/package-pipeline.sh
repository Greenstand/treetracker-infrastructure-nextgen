#!/bin/bash
set -e

if [ "$1" = "" ]
then
  echo "Usage: $0 <env>"
  exit
fi
ENV=$1

find ./build/ -name *.spec.js -exec rm {} \;

cp ../config/$ENV/pipeline-consumer/* build/treetracker-data-pipeline/consumer/config/
cp ../config/$ENV/pipeline-microservice/* build/treetracker-data-pipeline/microservice/config/
cp ../config/$ENV/pipeline-cron/* build/treetracker-data-pipeline/cron/config/
cp ../config/$ENV/analysis-microservice/* build/treetracker-analysis-pipeline/analysis-microservice/config/

cd build/treetracker-data-pipeline/consumer/
npm ci &
cd ../../../
cd build/treetracker-data-pipeline/microservice/
npm ci &
cd ../../../
cd build/treetracker-data-pipeline/cron/
npm ci &
cd ../../../

cd build/treetracker-analysis-pipeline/analysis-microservice/
npm ci &
cd ../../../
  
wait

tar -cvzf build/treetracker-pipeline-consumer.tar.gz --directory build/treetracker-data-pipeline/consumer/ . &
tar -cvzf build/treetracker-pipeline-microservice.tar.gz --directory build/treetracker-data-pipeline/microservice/ . &
tar -cvzf build/treetracker-pipeline-cron.tar.gz --directory build/treetracker-data-pipeline/cron/ . &
tar -cvzf build/treetracker-analysis-microservice.tar.gz --directory build/treetracker-analysis-pipeline/analysis-microservice/ . &

wait

echo "Done"
