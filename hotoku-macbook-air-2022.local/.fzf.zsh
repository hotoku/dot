# Setup fzf
# ---------
FZF_DIR=/opt/homebrew/opt/fzf


if [[ ! "$PATH" == *${FZF_DIR}/bin* ]]; then
    export PATH="${PATH:+${PATH}:}${FZF_DIR}/bin"
fi


# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${FZF_DIR}/shell/completion.zsh" 2> /dev/null


# Key bindings
# ------------
source "${FZF_DIR}/shell/key-bindings.zsh"
