#!/bin/bash
# Dotfiles installer using GNU Stow

DOTFILES_DIR="$HOME/Projects/sgraczyk/dotfiles"

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "Error: GNU Stow is not installed"
    echo "Install it with: brew install stow"
    exit 1
fi

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "Oh My Zsh installed successfully!"

    # Remove the default .zshrc created by Oh My Zsh installer
    # We'll be using our own custom .zshrc from the dotfiles repo
    if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
        echo "Removing default Oh My Zsh .zshrc (we'll use our custom one)..."
        rm "$HOME/.zshrc"
    fi
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
backup_if_exists "$HOME/.p10k.zsh"
backup_if_exists "$HOME/.gitconfig"
backup_if_exists "$HOME/.aerospace.toml"
backup_if_exists "$HOME/.finicky.js"
backup_if_exists "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
backup_if_exists "$HOME/.config/karabiner/karabiner.json"
backup_if_exists "$HOME/.config/zed/settings.json"

# Remove .DS_Store files that could cause conflicts
echo "Cleaning up .DS_Store files..."
find "$HOME" -maxdepth 1 -name ".DS_Store" -delete 2>/dev/null || true
find "$HOME/.oh-my-zsh" -name ".DS_Store" -delete 2>/dev/null || true
find "$HOME/.config" -name ".DS_Store" -delete 2>/dev/null || true

# Remove any old .backup directories that might cause conflicts
echo "Cleaning up old backup directories..."
rm -rf "$HOME/.oh-my-zsh/custom/themes/powerlevel10k.backup" 2>/dev/null || true

# Stow each package
for package in "${PACKAGES[@]}"; do
    echo "Stowing $package..."
    stow -v --no-folding "$package" -t "$HOME"
done

echo ""
echo "Done! Your dotfiles are now managed by GNU Stow."
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. (Optional) Run 'p10k configure' to customize your Powerlevel10k prompt"
echo ""
echo "To unstow a package: stow -D <package>"
echo "To restow a package: stow -R <package>"
