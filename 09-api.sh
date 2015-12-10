#!/bin/bash
source f.sh

say "The API is fairly easy to use."

CMD="cat sample.go"
p $CMD
eval $CMD | less

CMD="go run sample.go"
p $CMD
eval ./sample | garble | less

say "The API has allowed us to implement our own load-balancer and job scheduler, both deprecated thanks to Kubernetes 1.1"
