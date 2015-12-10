#!/bin/bash
source f.sh

say "We have IMO an interesting approach to ingress"

CMD="gcloud compute forwarding-rules list | grep gke"
p $CMD
eval $CMD | garble | less

CMD="cat services/frontend.json"
p $CMD
(cd cfg/resources/; eval $CMD | garble | less)

CMD="cat pods/frontend.json"
p $CMD
(cd cfg/resources/; eval $CMD | garble | less)

CMD="kubectl get pods -l name=frontend --no-headers -o name | head -n 1 | cut -c 5-"
p $CMD
eval $CMD | garble | less

CMD="kubectl logs \$(kubectl get pods -l name=frontend --no-headers -o name | head -n 1 | cut -c 5-)"
p $CMD
eval $CMD | grep -i Proxy | garble | less

CMD="kubectl get service redacted -o yaml"
p $CMD
eval $CMD | garble | less

CMD="kubectl get endpoints redacted"
p $CMD
eval $CMD | garble | less

CMD="kubectl get rc dns -o yaml"
p $CMD
eval $CMD | garble | less

say "Kubernetes 1.1 (ingress) completely obviates this, which is GREAT!"

