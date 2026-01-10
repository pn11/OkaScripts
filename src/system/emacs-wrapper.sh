#!/bin/bash
# Do not open Emacs in VSCode Terminal
if [ -n "$TERM_PROGRAM" ] && [ "$TERM_PROGRAM" = 'vscode' ]; then
    code "$@"
    exit $?
fi

# Check if Emacs daemon is running, if not, start it
if ! emacsclient -e "(emacs-version)" >/dev/null 2>&1; then
    emacs --daemon >/dev/null 2>&1
    # Wait for daemon to be ready
    for i in {1..10}; do
        if emacsclient -e "(emacs-version)" >/dev/null 2>&1; then
            break
        fi
        sleep 0.5
    done
fi

# Trim leading/trailing whitespace (including full-width spaces) from arguments
args=()
for arg in "$@"; do
    arg=$(echo "$arg" | sed -e 's/^[[:space:]　]*//' -e 's/[[:space:]　]*$//')
    args+=("$arg")
done

# Connect to daemon
exec emacsclient -t "${args[@]}"
