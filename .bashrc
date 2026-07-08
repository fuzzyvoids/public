# .bashrc

# Source global configs
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$HOME/.cargo/env:~/.config/emacs/bin:" ]]
then
  PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/env:$HOME/devel/bin/:~/.config/emacs/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    
    fi
  done
fi 


# Set custom aliases
alias ll='ls -lF'
alias la='ls -laF'

# Set emacs alias
alias emacs='emacsclient -c -t -a emacs'

unset rc

# Automatically create or attach to Tmux session
if command -v tmux &> /dev/null	&& [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

# Set input to Vim-style
set -o vi

# Custom prompt
# PS1='\A [\u@\h] \w \$ '
PROMPT_COMMAND='PS1_CMD1=$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR == 1{ split($2, a," ");print a[1]}'"'"'); PS1_CMD2=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[2m\]\t\[\e[0m\] \[\e[2m\]\d\[\e[0m\] \[\e[93m\]${PS1_CMD1}\[\e[0m\] [\[\e[92;1m\]\w\[\e[0m\]] \[\e[96;1m\]${PS1_CMD2}\n\[\e[0;37;2m\]\#\[\e[0m\] --> \[\e[1m\]\u\[\e[0m\]@\H \$ '

