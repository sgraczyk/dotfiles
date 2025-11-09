# dotfiles

Personal configuration files for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

- **Shell**: Zsh with Oh My Zsh (Gruvbox theme)
- **Editor**: Zed (Gruvbox Dark Hard theme)
- **Window Manager**: AeroSpace
- **Browser Router**: Finicky
- **Keyboard Customization**: Karabiner-Elements
- **Version Control**: Git
- **Node.js**: Volta

## Installation

### Prerequisites

```bash
brew install stow
```

### Install dotfiles

```bash
git clone git@github.com:sgraczyk/dotfiles.git ~/Projects/sgraczyk/dotfiles
cd ~/Projects/sgraczyk/dotfiles
./install.sh
```

The install script will:
- Backup existing config files (adds `.backup` suffix)
- Use GNU Stow to symlink configs to your home directory
- Keep your dotfiles organized by application

## Managing with Stow

```bash
cd ~/Projects/sgraczyk/dotfiles

# Install specific package
stow zsh

# Remove a package
stow -D git

# Reinstall a package (useful after edits)
stow -R aerospace

# Install all packages
stow zsh git aerospace finicky oh-my-zsh karabiner zed
```

## Directory Structure

Each subdirectory is a "stow package" that mirrors your home directory:

```
dotfiles/
├── zsh/          → ~/.zshrc, ~/.zshenv
├── git/          → ~/.gitconfig
├── aerospace/    → ~/.aerospace.toml
├── finicky/      → ~/.finicky.js
├── karabiner/    → ~/.config/karabiner/karabiner.json
├── zed/          → ~/.config/zed/settings.json
└── oh-my-zsh/    → ~/.oh-my-zsh/custom/themes/
```

## Features

- Clean .zshrc with no duplicate PATH entries
- Proper PATH ordering (Homebrew → Volta → others)
- Organized by application using Stow
- Easy to enable/disable specific configs
