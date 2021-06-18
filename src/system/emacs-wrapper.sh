#!/bin/bash
# Do not open Emacs in VSCode Terminal
if [ $TERM_PROGRAM = 'vscode' ]; then
    code $*
else
    exec emacsclient -t -a "" $*
fi
