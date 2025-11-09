# Homebrew (Apple Silicon)
export PATH="/opt/homebrew/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme (Gruvbox)
ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Editor
export EDITOR='nano'

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Rancher Desktop
export PATH="$HOME/.rd/bin:$PATH"

# Local binaries
[ -f "$HOME/.local/bin/env" ] && source "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"
