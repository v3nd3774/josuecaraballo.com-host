#!/bin/bash
source scripts/set-env.sh
source scripts/build.sh
cd $site
stack exec `site_exec_path` watch
cd ..
