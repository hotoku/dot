__hotoku_source_if_exists(){
    path=$1
    [ -f ${path} ] && source ${path}
}



# conda
_conda(){
    local commands="activate
deactivate
clean
config
create
help
info
init
install
list
package
remove
uninstall
run
search
update
upgrade
build
convert
ndebug
develop
env
index
inspect
metapackage
render
server
skeleton
verify"
    local cur=${COMP_WORDS[COMP_CWORD]}
    local prev=${COMP_WORDS[COMP_CWORD-1]}
    if [ ${prev} = conda ]; then
        local cand=${commands[@]}
    elif [ ${prev} = activate ]; then
        local cand=$(conda env list | grep -v "#" | awk '{print $1}')
    fi
    COMPREPLY=($(compgen -W "${cand[@]}" -- "${cur}"))
}
which conda > /dev/null 2>&1 && complete -F _conda conda


# history
export HISTSIZE=50000
export HISTFILESIZE=500000
export EDITOR=emacsclient
export HISTTIMEFORMAT="%d/%m/%y %T "


# alias
alias gst="git status"
alias gc="git commit"
alias tiga="tig --all"
alias fin="find . -type d -name .git -prune -o -type f -print"
alias cd=pushd
alias dirs="dirs -v"


# direnv
which direnv > /dev/null 2>&1 && eval "$(direnv hook bash)"


## git completion
__hotoku_source_if_exists /usr/local/etc/bash_completion.d/git-completion.bash
__hotoku_source_if_exists /usr/local/etc/bash_completion.d/git-prompt.sh


# ps1
if declare -F __git_ps1 > /dev/null; then
    export PS1='\[\e[0;32m\]\W\[\e[00m\]\[\e[0;33m\]$(__git_ps1 "[%s]")\[\e[00m\] \$ '
else
    export PS1='\[\e[0;32m\]\W\[\e[00m\]\[\e[0;33m\]\[\e[00m\] \$ '
fi


# fzf
__hotoku_source_if_exists ~/.fzf.bash
__hotoku_source_if_exists ~/projects/dot/fzf-extras/fzf-extras.sh



# gcloud
__hotoku_source_if_exists /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
__hotoku_source_if_exists /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc


# gh
if which gh > /dev/null; then
    eval "$(gh completion -s bash)"
fi


## rbenv
[[ -d ~/.rbenv  ]] && \
    export PATH=${HOME}/.rbenv/bin:${PATH} && \
    eval "$(rbenv init -)"

unset -f __hotoku_source_if_exists
