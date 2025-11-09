#!/bin/bash
# Dotfiles installer using GNU Stow

DOTFILES_DIR="$HOME/Projects/sgraczyk/dotfiles"

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "Error: GNU Stow is not installed"
    echo "Install it with: brew install stow"
    exit 1
fi

# Backup existing files
backup_if_exists() {
    local file="$1"
    if [ -e "$file" ] && [ ! -L "$file" ]; then
        echo "Backing up $file to $file.backup"
        mv "$file" "$file.backup"
    fi
}

cd "$DOTFILES_DIR" || exit 1

echo "Installing dotfiles with GNU Stow..."

# List of available packages
PACKAGES=("zsh" "git" "aerospace" "finicky" "oh-my-zsh" "karabiner" "zed")

# Backup existing files before stowing
backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.zshenv"
backup_if_exists "$HOME/.gitconfig"
backup_if_exists "$HOME/.aerospace.toml"
backup_if_exists "$HOME/.finicky.js"
backup_if_exists "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
backup_if_exists "$HOME/.config/karabiner/karabiner.json"
backup_if_exists "$HOME/.config/zed/settings.json"

# Stow each package
for package in "${PACKAGES[@]}"; do
    echo "Stowing $package..."
    stow -v "$package" -t "$HOME"
done

echo ""
echo "Done! Your dotfiles are now managed by GNU Stow."
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Run 'p10k configure' to customize your Powerlevel10k prompt"
echo ""
echo "To unstow a package: stow -D <package>"
echo "To restow a package: stow -R <package>"
