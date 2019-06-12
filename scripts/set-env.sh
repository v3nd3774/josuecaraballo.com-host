#!/bin/bash
project=josuecaraballo.com-host
project_version=`cat project.clj | grep defproject | perl -ne 'print $1 if /.+\"(.*?)\".+/' -`
docker_tag="$DOCKER_USERNAME/$project:$project_version"
h_port=80
c_port=3000
KEY_PATH=travisci.pem
aws s3 cp s3://josuecaraballo.com-host/$KEY_PATH .
chmod 400 $KEY_PATH
