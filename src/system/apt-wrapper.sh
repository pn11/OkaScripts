#!/bin/bash
# apt-get の履歴を保存する。

sudo apt-get $@

if [ $? -eq 0 ]
then
    echo $@ >> $HOME/.apt_hist.txt
fi
