# =============================================================================
# MACOS ZSHRC CONFIGURATION
# =============================================================================

# --- History Setup ---
HISTFILE=$HOME/.zhistory # Save command history to .zhistory in home dir
SAVEHIST=1000 # Keep 1000 commands in the history file on disk
HISTSIZE=999 # Keep 999 commands in memory during current session
setopt share_history  # Share history between all open terminal sessions
setopt hist_expire_dups_first # Remove duplicate commands first when history gets full
setopt hist_ignore_dups # Ignore duplicate commands for history
setopt hist_verify

# --- Completion using arrow keys (based on history) ---
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# --- Homebrew Plugins ---
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- NVM (Node Version Manager) ---
# Might remove since I just use mise
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --- Java (Homebrew OpenJDK) ---
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME=/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"

# --- pipx ---
export PATH="$PATH:$HOME/.local/bin"

# --- fzf ---
eval "$(fzf --zsh)"

# --- Bat (better cat) ---
export BAT_THEME=gruvbox-dark

# --- Eza (better ls) ---
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# ---- TheFuck ----
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# --- Zoxide (better cd) ---
eval "$(zoxide init zsh)"
alias cd="z"

# --- Git ---
alias ga="git add ."
alias gs="git status"
alias gst="git stash"
alias gstp="git stash pop"
alias gstls="git stash list"
alias glo10="git log --oneline -10"
alias gl="git log --oneline"

# --- Vim/Nvim ---
alias vim="nvim"

# --- Docker ---
alias "docker-pretty-ps"="docker ps --format '{{.Names}}\n\tContainer ID: {{.ID}}\n\tCommand: {{.Command}}\n\tImage: {{.Image}}\n\tCreatedAt: {{.CreatedAt}}\n\tStatus: {{.Status}}'"

# --- Other aliases ---
alias edit-zsh="nvim ~/.zshrc"
alias reload-zsh="source ~/.zshrc"
alias c="clear"
alias e="exit"

# --- Terraform (Homebrew) ---
if [ -f "/opt/homebrew/bin/terraform" ]; then
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /opt/homebrew/bin/terraform terraform
fi

# --- pnpm ---
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --- mise ---
if [ -f "$HOME/.local/bin/mise" ]; then
    eval "$($HOME/.local/bin/mise activate zsh)"
fi

# --- Homebrew Environment Variables ---
export HOMEBREW_NO_UPDATE_REPORT_FORMULAE=true
export HOMEBREW_NO_UPDATE_REPORT_CASKS=true

# --- Windsurf ---
if [ -d "$HOME/.codeium/windsurf/bin" ]; then
    export PATH="$HOME/.codeium/windsurf/bin:$PATH"
fi

# --- Load Local Customizations ---
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# -- Starship ---
eval "$(starship init zsh)"
