#!/bin/bash
set -e


# Requires npm i -g @loopback/build

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

if [ "$ENV" = "dar" ] && [ "$2" == "" ]
then
  BRANCH="dar-es-salaam"
elif  [ "$ENV" = "test" ] && [ "$2" == "" ]
then
  BRANCH="test_release"
fi

echo "Building branch '$BRANCH' using environment '$ENV'"

\rm -Rf build/*

if [ "$ENV" = "prod" ]
then
  export ANSIBLE_VAULT_PASSWORD_FILE=.vault_pass_prod.txt
else
  export ANSIBLE_VAULT_PASSWORD_FILE=.vault_pass.txt
fi

ansible localhost -m git -a "repo=git@github.com:Greenstand/treetracker-admin.git dest=build/treetracker-admin version=$BRANCH force=yes depth=1"

if [ "$ENV" = "prod" ]
then
  cd build/treetracker-admin/
#  npm version patch
#  git push --tags origin master
#  git push -f origin master:production
  cd ../../

fi

./scripts/package-admin.sh $ENV


