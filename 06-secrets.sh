#!/bin/bash
source f.sh

say "secrets are great, but we've only just scratched the surface with them"

CMD="kubectl get secrets"
p $CMD
eval $CMD | garble | less

CMD="kubectl get secret elasticsearch-token-5wt52 -o yaml # service account"
p $CMD
eval $CMD | garble | less

CMD="kubectl get secret redacted-mysql-secret -o yaml # opaque secret"
p $CMD
eval $CMD | garble | less

