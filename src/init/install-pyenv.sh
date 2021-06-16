#/bin/bash

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# install pyenv-update
git clone https://github.com/pyenv/pyenv-update.git ~/.pyenv/plugins/pyenv-update

echo "Now you need to add"
echo ' export PYENV_ROOT="$HOME/.pyenv"'
echo ' export PATH="$PYENV_ROOT/bin:$PATH""'
echo "in your .bashrc etc."
