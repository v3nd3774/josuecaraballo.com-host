#!/bin/bash
source scripts/set-env.sh
if [ "$1" = "jar" ]; then
  lein uberjar
elif [ "$1" = "image" ]; then
  docker build -t $docker_tag .
else
  echo "$1 not in (jar|image)..."
  exit 1
fi
