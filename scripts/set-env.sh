#!/bin/bash
project=josuecaraballo.com-host
project_version=`cat project.clj | grep def | perl -ne "print \$1 if /.+\"(.*?)\".+/" -`
docker_tag="$project:$project_version"
