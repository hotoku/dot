source ~/projects/dot/bash_profile.bash

export PATH=~/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
eval "$(rbenv init -)"
