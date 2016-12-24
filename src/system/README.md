# Scripts Related to System

## checkIPaddress

Print IP address and save it in the Dropbox so that one can know the address apart from the machine. Then one can log in via SSH etc. even if the address may often change.

## repeat

Repeat commands with specified interval. For example,

```sh
repeat 10 ls -l
```

will repeat `ls -l` every 10 seconds.

## send2dropbox

Copy specified files to `~/Dropbox`.
