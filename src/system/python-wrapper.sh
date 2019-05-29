#!/bin/bash
# Python を実行する時にカレントディレクトリに
# venv ディレクトリがある場合にそれを使う。

if [ -e venv/bin/activate ]
then
    source venv/bin/activate
fi

python $@
