#!/bin/bash
source scripts/set-env.sh
cd $site
stack exec `site_exec_path` clean
cd ..
