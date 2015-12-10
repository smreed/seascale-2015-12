#!/bin/bash

kubectl delete pod seascale >/dev/null 2>&1

./00-meta.sh
./01-intro.sh
./02-grafana.sh
./03-nodes.sh
./04-configuration.sh
./05-stuff.sh
./06-secrets.sh
./07-ingress.sh
./08-jobs.sh
./09-api.sh
./10-fungible.sh
