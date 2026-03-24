# Setup fzf
# ---------
if [[ "$OSTYPE" == "darwin"* ]] && [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

eval "$(fzf --bash)"
