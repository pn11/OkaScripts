#!/bin/bash

for file in `echo $@ | xargs -n1`
do
    rsync -avrth $file ~/Dropbox
done
