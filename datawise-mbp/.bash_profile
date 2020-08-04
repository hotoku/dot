source ~/project/dot/bash_profile.bash




# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hotoku/google-cloud-sdk/path.bash.inc' ]; then . '/Users/hotoku/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hotoku/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/hotoku/google-cloud-sdk/completion.bash.inc'; fi





# tmuxとanacondaの設定の相性が悪いので、ad hocなwork aroundを設定する。
# /Users/hotoku/anaconda3/bin がPATHの先頭以外の位置にあったら、先頭に持ってくる
# 念のため、PATHの途中にある/Users/hotoku/anaconda3/binの削除しておく
ANACONDA_BIN=/usr/local/anaconda3/bin
if ! echo ${PATH} | grep ^${ANACONDA_BIN}; then
    PATH=${ANACONDA_BIN}:${PATH}
    PATH=$(echo $PATH | sed -E -e "s|:${ANACONDA_BIN}||g")
fi
export PATH


PATH=~/bin:${PATH}

export PATH="$HOME/.poetry/bin:$PATH"
export PAT=/usr/local/texlive/2020/bin/x86_64-darwin/platex:$PATH


[[ -f ~/.bashrc ]] && source ~/.bashrc
