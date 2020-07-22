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
  BRANCH="test-release"
fi

if [ "$3" != "" ]
then
  REPOSITORY=$3
else
  REPOSITORY=Greenstand/treetracker-web-map
fi



echo "Building branch '$BRANCH' using environment '$ENV'"


