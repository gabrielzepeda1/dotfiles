#!/usr/bin/env bash

set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
	printf 'This bootstrap script currently supports macOS only.\n' >&2
	exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
	printf 'Homebrew is required. Install it from https://brew.sh, then rerun this script.\n' >&2
	exit 1
fi

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

brew bundle --file="$DOTFILES_DIR/homebrew/.Brewfile"

stow --dir="$DOTFILES_DIR" --target="$HOME" --restow \
	aerospace git homebrew nvim opencode starship wezterm zsh
