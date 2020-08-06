# export PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"
export HISTSIZE=50000
export HISTFILESIZE=500000
export EDITOR=emacsclient


which direnv && eval "$(direnv hook bash)"


alias gst="git status"
alias gc="git commit"
alias tiga="tig --all"
alias fin="find . -type d -name .git -prune -o -type f -print"

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

complete -F _conda conda
export PS1='\[\e[0;32m\]\W\[\e[00m\]\[\e[0;33m\]$(__git_ps1 "[%s]")\[\e[00m\] \$ '
