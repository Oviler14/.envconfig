# Setup fzf
# ---------
if [[ ! "$PATH" == */home/oliman01/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/oliman01/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/oliman01/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/oliman01/.fzf/shell/key-bindings.bash"
