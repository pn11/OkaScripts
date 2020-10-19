#/bin/bash
# Rewrite BindAddress in ~/.ssh/config by getting VPN address.
address=$(ifconfig ppp0 | tail -1 | sed -E "s/.*inet\ (.*)\ -->.*/\1/g")
sed -i -E "s/BindAddress (.*)/BindAddress ${address}/g" ~/.ssh/config
