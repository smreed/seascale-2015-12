#!/bin/bash
source f.sh

say "Any CPU is good CPU"

CMD="kubectl get pods -l name=redacted-api --no-headers -o name | head -n 1"
p $CMD
eval $CMD | garble | less

CMD="kubectl delete \$(kubectl get pods -l name=redacted-api --no-headers -o name | head -n 1)"
p $CMD
eval $CMD | garble | less

CMD="kubectl get events | grep lookup"
p $CMD
eval $CMD | garble | less

say "Dev/Test/Prod is a designation for your process, not for the underlying infrastructure"

say "For example, this demo..."

CMD="kubectl run -i --tty seascale --image=gcr.io/redacted/seascale-2015-12:58aff06 --restart=Never --command -- ./10-fungible.sh"
p $CMD
eval $CMD

say "The End!"
