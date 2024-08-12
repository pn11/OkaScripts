#!/bin/bash
# WIP: Collect images from a directory tree

set -euxo pipefail

ROOT=$1

# this loop will  be a function and to be recursively called
for dir in $(ls -F $ROOT | grep / )
do
    echo $ROOT/$dir
done
