#!/bin/bash

echo "command: ${@:2}"
echo "interval: $1"
echo ""

while [ 1 ]
  do
  ${@:2}

  echo ""
  date
  echo""

  sleep $1
done
