#!/bin/bash
source scripts/set-env.sh
if [ ! -d "$site" ]; then
  stack exec hakyll-init $site
  cd $site
  stack init
  cd ..
fi
cd $site
stack build
stack exec `site_exec_path` build
cd ..
