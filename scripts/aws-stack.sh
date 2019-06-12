#!/bin/bash
set -x
source scripts/set-env.sh
aws s3 cp s3://josuecaraballo.com-host/$KEY_PATH .
chmod 400 $KEY_PATH
if [ "$1" = "delete" ]; then
  for publicdns_string in $(
  aws ec2 describe-instances | \
    jq '.Reservations |
        .[] |
        .Instances |
        .[] |
        select(.State | .Name | contains("running")) |
        .NetworkInterfaces |
        .[0] |
        .Association |
        .PublicDnsName'
  ); do
    publicdns=`echo $publicdns_string | perl -ne 'print $1 if /"(.*?)"/' -`
    ssh -o StrictHostKeyChecking=no -i $KEY_PATH ec2-user@$publicdns '
      sudo docker container stop $(docker container ls -aq)
      sudo docker container rm $(docker container ls -aq)
    '
  done
elif [ "$1" = "create" ]; then
  for publicdns_string in $(
  aws ec2 describe-instances | \
    jq '.Reservations |
        .[] |
        .Instances |
        .[] |
        select(.State | .Name | contains("running")) |
        .NetworkInterfaces |
        .[0] |
        .Association |
        .PublicDnsName'
  ); do
    publicdns=`echo $publicdns_string | perl -ne 'print $1 if /"(.*?)"/' -`
    ssh -o StrictHostKeyChecking=no -i $KEY_PATH ec2-user@$publicdns "
      set -x
      sudo yum update -y
      sudo amazon-linux-extras install -y docker
      sudo service docker start
      sudo usermod -a -G docker ec2-user
      sudo docker run -p $h_port:$c_port $docker_tag
    "
  done
else
  echo "$1 not in (jar|image)..."
  exit 1
fi

