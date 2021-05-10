source ~/projects/dot/bash_profile.bash

export PATH=~/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
eval "$(rbenv init -)"
eval 'eval "$(pyenv virtualenv-init -)"'

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export JDSC_USER_ID=yasunori.horikoshi@jdsc.ai
export ATTTA_GOOGLE_USER=hotoku@attta.co.jp
