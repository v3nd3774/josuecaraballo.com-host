## What is this repo?

This is a repository to store the source code for the [`josuecaraballo.com`](javascript:void(0)).

## How does this work?

There is a CDN service that caches data which is produced by a load balancer. 
The load balancer forwards traffic to instances in an autoscale group which process and respond to the `HTTP` requests.
The figure below illustrates this flow.
<p align="center">
  <img alt="Infrastructure Illustration" src="images/AmazonEC2Infrastructure.png">
</p>

## But how do they produce the `HTTP` traffic?

There is a Clojure webapp that interfaces with a database to respond to the `HTTP` requests.
The figure below illustrates this flow.
<p align="center">
  <img alt="EC2 Contents Illustration" src="images/AmazonEC2Contents.png">
</p>
