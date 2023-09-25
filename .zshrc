# oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HIST_STAMPS="%Y-%m-%d %H:%M:%S"
plugins=(git)


if [[ -f ${ZSH}/oh-my-zsh.sh ]]; then
    source $ZSH/oh-my-zsh.sh
else
    echo "install oh-my-zsh !"
fi


# path todo: カスタマイズ対象
path=(
    $HOME/bin
    $HOME/.local/bin # poetry
    $path
)


# homebrew
if ! [[ -z "${HOMEBREW_PREFIX}" ]]; then
    path=(
        /opt/homebrew/bin
        /opt/homebrew/opt/llvm/bin
        /usr/local/bin
        $path
    )
fi


# pyenv
if type pyenv >/dev/null 2>&1; then
    # Add pyenv executable to PATH and
    # enable shims by adding the following
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    # Load pyenv into the shell by adding
    eval "$(pyenv init -)"
fi


# editor
export EDITOR=emacsclient


# fzf
if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
fi


# direnv
if type direnv > /dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi


# history
export HISTSIZE=50000
export SAVEHIST=50001
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS


# todo: カスタマイズ対象
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"


# anyenv
if type anyenv > /dev/null 2>&1; then
    eval "$(anyenv init -)"
fi


# terraform completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform


# aws_completion
# [2023-09-22] 最近はawsコマンドを使ってないので、ちゃんと動くのか分からない
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
if [[ -f '/opt/homebrew/bin/aws_completer' ]]; then
    complete -C '/opt/homebrew/bin/aws_completer' aws
elif [[ -f '/usr/local/bin/aws_completer' ]]; then
    complete -C '/usr/local/bin/aws_completer' aws
fi


# gcloud todo: カスタマイズ対象
GCLOUD_HOME="${HOME}"/google-cloud-sdk
if [[  -d ${GCLOUD_HOME} ]]; then
    . ${GCLOUD_HOME}/path.zsh.inc
    . ${GCLOUD_HOME}/completion.zsh.inc
fi
