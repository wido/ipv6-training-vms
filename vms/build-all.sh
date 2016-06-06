#!/bin/bash

set -e

which packer || (echo "Please make sure Packer.io is installed and present in PATH"; exit 1)

cd `dirname $0`

for DIR in $(find . -mindepth 1 -maxdepth 1 -type d); do
    $DIR/build.sh
done
