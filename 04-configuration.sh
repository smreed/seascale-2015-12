#!/bin/bash
source f.sh

say "this is how we manage our kubernetes configuration"

CMD="tree -d"
p $CMD
(cd cfg; eval $CMD | garble | less)

CMD="git log --abbrev-commit --pretty=format:'%h -%d %s %cr - %an' | tail -n 1"
p $CMD
(cd cfg; eval $CMD | garble | less)

CMD="git log --abbrev-commit --pretty=format:'%h -%d %s %cr - %an' | wc -l"
p $CMD
(cd cfg; eval $CMD | less)

CMD="git show 4dc983b # example of scale-out"
p $CMD
(cd cfg; eval $CMD | garble | less)

CMD="git show 017b8cd # example of image upgrade"
p $CMD
(cd cfg; eval $CMD | garble | less)
