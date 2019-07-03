#!/bin/bash
source scripts/set-env.sh
source scripts/clean.sh
source scripts/build.sh
cp -a josuecaraballo/_site/. .
git add .
git commit -am "Publish blog"
git push
