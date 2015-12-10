#!/bin/bash
source f.sh

say "how big is our Kubernetes cluster?"

CMD="kubectl get nodes --no-headers | wc -l"
p $CMD
eval $CMD | less

CMD="kubectl describe \$(kubectl get nodes -o name --no-headers | head -n 1)"
p $CMD
eval $CMD | garble | less
