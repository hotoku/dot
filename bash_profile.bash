# export PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"
export HISTSIZE=50000
export EDITOR=emacsclient


eval "$(direnv hook bash)"


alias gst="git status"
alias gc="git commit"
alias tiga="tig --all"


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
debug
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

_make(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    local prev=${COMP_WORDS[COMP_CWORD-1]}
    if [ $(echo ${prev} | cut -c1) != "-" ]; then
        local cand=$(cat Makefile | grep -E "^[a-zA-Z0-9_-]+:" | cut -d":" -f1)
    fi
    COMPREPLY=($(compgen -W "${cand[@]}" -- "${cur}"))    
}


complete -F _conda conda
# complete -F _make make


alias connect="BluetoothConnector -c 68-fe-f7-7c-a8-de -n; BluetoothConnector -c ac-88-fd-ed-bf-38 -n"
alias disconnect="BluetoothConnector -d 68-fe-f7-7c-a8-de -n; BluetoothConnector -d ac-88-fd-ed-bf-38 -n"


[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"


export PS1='\[\e[0;32m\]\W\[\e[00m\]\[\e[0;33m\]$(__git_ps1 "[%s]")\[\e[00m\] \$ '
