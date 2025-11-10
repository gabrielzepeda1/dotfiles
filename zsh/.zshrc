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
export BAT_THEME=tokyonight_storm
>>>>>>> 3fa1709 (updates from macos):.zshrc

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
alias gst="git stash"
alias gstp="git stash pop"
alias glo10="git log --oneline -10"
# --- Vim/Nvim ---
alias vim="nvim"

# --- Docker --- 
# docker ps with better output
alias "docker-pretty-ps"="docker ps --format '{{.Names}}\n\tContainer ID: {{.ID}}\n\tCommand: {{.Command}}\n\tImage: {{.Image}}\n\tCreatedAt: {{.CreatedAt}}\n\tStatus: {{.Status}}'"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Load private/local zsh customizations if present
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Added by Windsurf
export PATH="/Users/gz-solidlogix/.codeium/windsurf/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/gz-solidlogix/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
eval "$(/Users/gz-solidlogix/.local/bin/mise activate zsh)"
