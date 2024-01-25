export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export SHELL="/bin/zsh"
 #Set name of the theme to load --- if set to "random", it will
ZSH_THEME="kayid" # set by `omz`

HYPHEN_INSENSITIVE="true"

plugins=(aliases 
        colored-man-pages 
        systemd 
        git 
        dnf 
        vi-mode 
        tmux 
        nomad 
        pre-commit 
        starship 
        zoxide 
        gh
      )
source $ZSH/oh-my-zsh.sh
export VIMCONF="$HOME/.config/nvim/"  

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
alias ls="lsd"
alias l="lsd -la"
alias vim="nvim"
alias wlcp="wl-copy"
alias wlp="wl-paste"
alias j="just"

## keybindings
bindkey -s "^[n" "nvim^M"
bindkey -s "^[l" "l^M"
bindkey -s "^[t" "tmux^M"

tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }

