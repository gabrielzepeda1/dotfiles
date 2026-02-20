# dotfiles

Config files for my dev setup. Managed with [`gnu-stow`](https://www.gnu.org/software/stow/) — each package directory mirrors the structure under `~`.

## Structure

Each package follows the stow convention:

```
wezterm/
└── .wezterm.lua          # → ~/.wezterm.lua
```

```
<package>/
└── .config/
    └── <package>/
        └── config.*      # → ~/.config/<package>/config.*
```

| Package | Tool | What it configures |
|---|---|---|
| `aerospace` | [AeroSpace](https://github.com/nikitabobko/AeroSpace) | Tiling WM — workspaces, `alt-hjkl` focus/move, app → workspace routing |
| `git` | Git | Global identity, SSH signing, `delta` pager, rebase-on-pull, work identity conditional include |
| `homebrew` | Homebrew | `.Brewfile` — all taps, formulas, and casks; `brew bundle` to install everything |
| `nvim` | Neovim *(submodule)* | Full Neovim config — tracked separately at [`gabrielzepeda1/nvim`](https://github.com/gabrielzepeda1/nvim) |
| `opencode` | [OpenCode](https://opencode.ai) | AI coding agent — autoupdate, `context7` MCP server |
| `wezterm` | WezTerm | Terminal — Catppuccin Mocha, JetBrains Mono, opacity, keybindings |
| `zsh` | Zsh | Shell — Starship prompt, aliases, `eza`/`zoxide`/`bat`/`fzf`, `mise`, plugins |

## Quick Start

**Prerequisites:** `git`, `stow` (`brew install stow`), and any tools you want to configure.

1. Clone with submodules:
   ```sh
   git clone --recurse-submodules <repo-url> ~/dotfiles
   ```
2. Stow everything or a single package:
   ```sh
   cd ~/dotfiles
   stow .                   # all packages
   stow wezterm             # single package
   ```
3. (Optional) Add `~/.zshrc.local` for machine-specific overrides and env variables — sourced automatically by `.zshrc`.

## New setup from scratch (macOS)

1. Check shell (macOS uses zsh by default):
```bash
echo $SHELL
# Should show /bin/zsh
```

2. Install Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. Add Homebrew to PATH (new terminal):
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

4. Install stow (required for dotfiles):
```bash
brew install stow
```

5. Clone repo:
```bash
git clone --recurse-submodules <repo-url> ~/dotfiles
cd ~/dotfiles
```

6. Install all Homebrew packages from the Brewfile:
```bash
stow homebrew   # symlinks ~/.Brewfile
brew bundle     # installs all taps, formulas, and casks
```

7. Symlink all dotfiles:
```bash
stow .
```

8. (Optional) Add `~/.zshrc.local` for machine-specific overrides and env variables — sourced automatically by `.zshrc`.
