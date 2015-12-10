#!/bin/bash
source f.sh

say "kubectl get..."

CMD="kubectl get pods -l version # default output"
p $CMD
eval $CMD | garble | less

CMD="kubectl get pods -l version -L version # get custom labels on CLI"
p $CMD
eval $CMD | garble | less

CMD="kubectl get rc --all-namespaces --no-headers | wc -l"
p $CMD
eval $CMD | less

CMD="kubectl get pods --all-namespaces --no-headers | wc -l"
p $CMD
eval $CMD | less

CMD="kubectl get services --all-namespaces --no-headers | wc -l"
p $CMD
eval $CMD | less

CMD="kubectl get secrets --no-headers | wc -l"
p $CMD
eval $CMD | less

CMD="kubectl get pv --no-headers | wc -l"
p $CMD
eval $CMD | less

CMD="kubectl get pvc --all-namespaces --no-headers | wc -l"
p $CMD
eval $CMD | less

