#!/bin/bash
source scripts/set-env.sh
source scripts/clean.sh
source scripts/build.sh
cp -a josuecaraballo/_site/. .
git add .
git merge -m "Publish blog" static_site
git commit -m "Publish blog"
git push
