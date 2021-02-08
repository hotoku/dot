source ~/projects/dot/bash_profile.bash

export PATH=~/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
