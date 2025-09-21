# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh export LC_ALL=en_US.UTF-8

# history setup
HISTFILE=$HOME/.zhistory # Save command history to .zhistory in home dir
SAVEHIST=1000 # Keep 1000 commands in the history file on disk
HISTSIZE=999 # Keep 999 commands in memory during current session
setopt share_history  # Share history between all open terminal sessions
setopt hist_expire_dups_first # Remove duplicate commands first when history gets full
setopt hist_ignore_dups # Ignore duplicate commands for history 
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME=/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"

# Created by `pipx` on 2025-05-21 15:58:55
export PATH="$PATH:/Users/gz-solidlogix/.local/bin"

# --- fzf --- 
eval "$(fzf --zsh)"

# --- Bat (better cat) ---

export BAT_THEME=tokyonight_night

# --- Eza (better ls) ---

alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# ---- TheFuck ----
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# --- Zoxide (better cd) ---
eval "$(zoxide init zsh)"
alias cd="z"

# --- Other aliases ---
alias edit-zsh="nvim ~/.zshrc"
alias reload-zsh="source ~/.zshrc"
alias c="clear"
alias e="exit"

# --- Git --- 
alias ga="git add ."
alias gs="git status"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Load private/local zsh customizations if present
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
