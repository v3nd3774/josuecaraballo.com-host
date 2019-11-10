#!/bin/bash
source scripts/set-env.sh
source scripts/clean.sh
source scripts/build.sh
cp -a josuecaraballo/_site/. .
git add .
git merge -m "Publish blog" static_site
git commit -m "Publish blog"
git push
git checkout static_site
git merge -m "fast forward" master
rm -rf *.html css/ images/ posts/
git add .
git commit -m "fast forward"
git push --set-upstream origin static_site
