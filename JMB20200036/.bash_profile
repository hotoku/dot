source ~/projects/dot/bash_profile.bash

export PATH=~/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/hotoku/.pyenv/versions/anaconda3-2019.03/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/hotoku/.pyenv/versions/anaconda3-2019.03/etc/profile.d/conda.sh" ]; then
        . "/Users/hotoku/.pyenv/versions/anaconda3-2019.03/etc/profile.d/conda.sh"
    else
        export PATH="/Users/hotoku/.pyenv/versions/anaconda3-2019.03/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

