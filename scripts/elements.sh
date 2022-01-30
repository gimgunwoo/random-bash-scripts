#!/bin/bash
# https://stackoverflow.com/a/8574392
# containsElement function will return 0 if the first arg has a match in an array,
# but will return 1 if there is no match.

containsElement () {
  local e match="$1"

  # https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_07.html
  shift

  # https://stackoverflow.com/questions/3685970/check-if-a-bash-array-contains-a-value#comment94846812_8574392
  # https://tldp.org/LDP/abs/html/loops1.html#EX23
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

array=("hello" "world" "random" "bash")

containsElement "$1" "${array[@]}"
