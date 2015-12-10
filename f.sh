#!/bin/bash
function p {
  clear
  read -n1 -r -p "> $(echo $* | garble)" foobar
}

function say {
  clear
  cowsay $*
  read -n1 -r -p "" foobar
}
