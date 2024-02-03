export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export SHELL="/bin/zsh"

HYPHEN_INSENSITIVE="true"
ZSH_COLORIZE_TOOL=chroma
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
plugins=(
        aliases 
        colored-man-pages 
        colorize
        dnf 
        gh
        git 
        jsontools
        nomad 
        podman
        pre-commit 
        starship 
        systemd 
        tmux 
        vi-mode 
        zoxide 
      )
source "$ZSH/oh-my-zsh.sh"
export VIMCONF="$HOME/.config/nvim/"  

# Custom Functions
# From omz plugin, modified to work with wayland or x11
function cpth {
  local file="${1:-.}"
  [[ $file = /* ]] || file="$PWD/$file"
  local clipboard=clipcopy
  [[ $XDG_SESSION_TYPE == "x11" ]] || clipboard="wl-copy"

  print -n "${file:a}" | $clipboard || return 1
  echo ${(%):-"%B${file:a}%b copied to clipboard."}
}

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
alias cpst="clippaste"
## keybindings
bindkey -s "^[n" "nvim^M"
bindkey -s "^[l" "l^M"
bindkey -s "^[t" "tmux^M"

tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }

