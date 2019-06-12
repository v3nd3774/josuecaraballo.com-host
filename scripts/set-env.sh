#!/bin/bash
project=josuecaraballo.com-host
project_version=`cat project.clj | grep defproject | perl -ne 'print $1 if /.+\"(.*?)\".+/' -`
docker_tag="$DOCKER_USERNAME/$project:$project_version"
