#/bin/bash
# Rewrite BindAddress in ~/.ssh/config by getting VPN address.
address=$(ifconfig ppp0 | tail -1 | sed -E "s/.*inet\ (.*)\ -->.*/\1/g")

CONFIG=~/.ssh/config
if [ -L $CONFIG ]; then
    # if symbolic link
    CONFIG=$(readlink $CONFIG)
fi

sed -i.bak -E "s/BindAddress (.*)/BindAddress ${address}/g" $CONFIG
