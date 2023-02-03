# path
path=(
    $HOME/bin
    /opt/homebrew/bin
    /usr/local/bin
    $path
)
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"


## zsh


# Path to your oh-my-zsh installation.
export ZSH="/Users/hotoku/.oh-my-zsh"


ZSH_THEME="robbyrussell"
HIST_STAMPS="%Y-%m-%d %H:%M:%S"
plugins=(git)


# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"


# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"


source $ZSH/oh-my-zsh.sh


## my original settings
export EDITOR=emacsclient
eval "$(anyenv init -)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook zsh)"


# history
export HISTSIZE=50000
export SAVEHIST=50001
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS


# aws_completion
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit


AWSCOMP_BIN=/opt/homebrew/bin/aws_completer
if [[ -f "${AWSCOMP_BIN}" ]]; then
    complete -C "${AWSCOMP_BIN}" aws
fi


# gcloud
GCLOUD_SDK_DIR=/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
source ${GCLOUD_SDK_DIR}/completion.zsh.inc
source ${GCLOUD_SDK_DIR}/path.zsh.inc
