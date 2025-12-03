# .bashrc

# Source global configs
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  donefi 

unset rc

# Automatically create or attach to Tmux session
if command -v tmux &> /dev/null/ && [ -z "$TMUX ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

# Set input to Vim-style
set -o vi

# Custom prompt
PS1='\A [\u@\h] \w \$ '
