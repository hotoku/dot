export PS1="\[\e[0;32m\]\W \$ \[\e[00m\]"
# export PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"
export HISTSIZE=50000


eval "$(direnv hook bash)"


alias gst="git status"
alias gc="git commit"
