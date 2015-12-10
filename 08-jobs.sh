#!/bin/bash
source f.sh

say "We recently were able to dramatically simplify our data ingestion process."

CMD="cat pods/ingestor-scheduler.json"
p $CMD
(cd cfg/resources/; eval $CMD | garble | less)

CMD="kubectl get pods -l ingestor-scheduler"
p $CMD
eval $CMD | garble | less

say "Kubernetes 1.1 (jobs) completely obviates this, which is GREAT!"
