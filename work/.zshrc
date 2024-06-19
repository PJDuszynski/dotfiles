
export PATH="$PATH:$HOME/.dotfiles/scripts"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/neovim/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.rye/env:$PATH"
source "$HOME/.rye/env"

[[ -f "$HOME/.config/ripgrep/config" ]] && export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
[[ -f "$HOME/.config/broot/launcher/bash/br" ]] && . "$HOME/.config/broot/launcher/bash/br"
[[ -f "$HOME/.dotfiles/config/fzf.zsh" ]] && . "$HOME/.dotfiles/config/fzf.zsh"

export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
[[ -d "/mnt/c/Program Files/Oracle/VirtualBox" ]] && export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

setopt globdots
unsetopt BEEP
unsetopt LIST_BEEP

export EDITOR="nvim"
export DISPLAY=""
export LS_COLORS=$LS_COLORS:"ow=30;42:"
export LESSOPEN='| ~/.lessfilter %s'
export GROFF_NO_SGR=1

export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

alias ls="lsd"
alias l="lsd -la"
alias j=just
alias gj="just --justfile ~/.justfile --working-directory ."
alias jl="just --list"
alias lg=lazygit
alias zj="zellij"
alias zja="zellij attach"
alias tree="br -c :pt"
alias sudome="sudo --preserve-env=HOME"
alias mc="mc --nosubshell"
alias zshrc="$EDITOR ~/dotfiles/work/.zshrc"
alias rp="realpath"
alias vim="nvim"
alias v="source .venv/bin/activate"
alias tv="tidy-viewer"
alias ptpy="ptpython"
alias clc="clickhouse client"
bindkey '^H' backward-kill-word
bindkey '5~' kill-word
bindkey '^[[1;5H' backward-kill-line
bindkey '^[[1;5F' kill-line
bindkey '^[t' 'tmux^M'


fastfile_var_prefix="@"

function update-nvim {
  local nvim_dir="$HOME/.config/nvim/lua/custom"
  echo "Checking for updated neovim config..."
  pushd
  cd "$nvim_dir" && git stash
  git pull
  git stash pop
  popd
}

function update-dotfiles {
  local dotfiles="$HOME/dotfiles"
  echo "Checking for updated dotfiles..."
  cd "$dotfiles" && git pull
}

if [[ -d "$HOME/.oh-my-zsh" ]]; then
  export ZSH="$HOME/.oh-my-zsh"

  fpath+="$HOME/.oh-my-zsh/custom/plugins/zsh-completions/src"
  DISABLE_UPDATE_PROMPT=true
  DISABLE_MAGIC_FUNCTIONS=true
  CASE_SENSITIVE=false
  HYPHEN_INSENSITIVE=true
  ZSH_THEME="powerlevel10k/powerlevel10k"
  ZSH_DISABLE_COMPFIX=true

  plugins=(
    aliases
    direnv
    dirhistory
    dnf
    fastfile
    fd
    fzf
    git
    colored-man-pages
    npm
    pip
    ripgrep
    nomad
    podman
    zoxide
    jsontools
    gh
    starship
    rust
    sudo
    vagrant
    wd
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf-tab
    zsh-shift-select
  )

  [[ -f "$ZSH/oh-my-zsh.sh" ]] && . "$ZSH/oh-my-zsh.sh"
fi


[[ -f "$HOME/.zshrc.local" ]] && . "$HOME/.zshrc.local"


source $HOME/.dbt-completion.bash
source /home/pduszynski/.config/broot/launcher/bash/br
eval "$(starship init zsh)"
