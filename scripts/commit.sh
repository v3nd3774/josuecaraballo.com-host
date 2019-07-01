#!/bin/bash
source scripts/set-env.sh
source scripts/clean.sh
git add .
git status
read -p 'Commit Message' commitmsg
git add .
git commit -am "${commitmsg}"
