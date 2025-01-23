#!/bin/bash
# Do not open Emacs in VSCode Terminal
if [ -n "$TERM_PROGRAM"  ] && [ "$TERM_PROGRAM" = 'vscode' ]; then
    code $*
else
    exec emacsclient -t -a "" $*
fi
