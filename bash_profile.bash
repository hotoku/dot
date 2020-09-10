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
which conda > /dev/null && complete -F _conda conda

# history
export HISTSIZE=50000
export HISTFILESIZE=500000
export EDITOR=emacsclient

# alias
alias gst="git status"
alias gc="git commit"
alias tiga="tig --all"
alias fin="find . -type d -name .git -prune -o -type f -print"

# direnv
which direnv > /dev/null && eval "$(direnv hook bash)"

# ps1
if declare -F __git_ps1 > /dev/null; then
    export PS1='\[\e[0;32m\]\W\[\e[00m\]\[\e[0;33m\]$(__git_ps1 "[%s]")\[\e[00m\] \$ '
else
    export PS1='\[\e[0;32m\]\W\[\e[00m\]\[\e[0;33m\]\[\e[00m\] \$ '
fi

# fzf
if [[ -d ~/projects/dot/fzf-extras/.git ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
    source ~/projects/dot/bash_profile.bash
    source ~/projects/dot/fzf-extras/fzf-extras.sh
fi
