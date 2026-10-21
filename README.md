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
| `opencode` | [OpenCode](https://opencode.ai) | AI coding agent — autoupdate, `context7` MCP server, npm manifest/lockfile for plugin dependencies |
| `wezterm` | WezTerm | Terminal — Kanagawa Bones, JetBrains Mono, keybindings |
| `zsh` | Zsh | Shell — Starship prompt, aliases, `eza`/`zoxide`/`bat`/`fzf`, `mise`, plugins |

## Quick Start (macOS)

**Prerequisites:** macOS, Git, and [Homebrew](https://brew.sh). The bootstrap installs the Brewfile packages (including GNU Stow) and links the dotfiles.

```sh
git clone --recurse-submodules <repo-url> ~/dotfiles
cd ~/dotfiles
./scripts/bootstrap.sh
```

The script runs `brew bundle` against `homebrew/.Brewfile`, then Stows each package. Stow reports conflicts rather than overwriting existing files; resolve any conflicts and rerun the script. The Brewfile is a curated list of CLI tools, apps, and required taps. VS Code extensions are not managed by this repository. Docker CLI and Podman are included; Docker Desktop is not. Node.js versions are managed with mise, with pnpm installed through Homebrew.

After Stowing the Homebrew package, use `brew bundle --global` to install packages or `brew bundle check --global` to check for missing packages. Removing a Brewfile entry does not uninstall existing software.

To link just one package after setup:

```sh
stow wezterm
```

Add `~/.zshrc.local` for machine-specific shell settings; `.zshrc` sources it automatically.

## OpenCode dependencies

The OpenCode config includes `package.json` and `package-lock.json` for npm-managed plugin dependencies. With Node.js/npm installed, run `npm ci` from `opencode/.config/opencode` when you need those dependencies. OpenCode itself is installed separately through Homebrew; its config does not require npm just to load.
