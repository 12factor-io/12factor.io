#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

gen_random_filename() {
  local wordfile=$DIR/dictionary.txt
  local randwords
  local title

    randwords=`shuf -n 1 $wordfile|sed 's/[^a-zA-Z]//g'`
    title=`echo $randwords|tr ' ' '_'| tr '[:upper:]' '[:lower:]'`
 echo $title
}

RANDOM_STACK_NAME=$(gen_random_filename)
export ENVIRONMENT="${TRAVIS_BRANCH:-development}"
export STACK_NAME="${STACK_NAME:-$RANDOM_STACK_NAME}"   # or result=`myfunc`

envsubst '${ENVIRONMENT},${STACK_NAME}' < "$DIR/terraform.tfvars.tpl" > "$DIR/../terraform.tfvars"
