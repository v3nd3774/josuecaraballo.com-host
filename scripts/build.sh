#!/bin/bash
project=josuecaraballo.com-host
if [ -z "$TRAVIS_BUILD_NUMBER" ]; then
  TRAVIS_BUILD_NUMBER=DEV
fi
project_version=`cat $project/project.clj | grep def | perl -ne "print \$1 if /.+\"(.*?)\".+/" -`
if [ "$1" -eq "jar" ]; then
  cd $project
  lein uberjar
elif [ "$1" -eq "image" ]; then
  docker build -t v3nd3774/josuecaraballo.com-host:$TRAVIS_BUILD_NUMBER
else
  echo "$1 not in (jar|image)..."
  exit 1
fi
