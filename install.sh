#!/bin/bash
# Dotfiles installer using GNU Stow
# Designed for clean installations

set -e  # Exit on error

DOTFILES_DIR="$HOME/Projects/sgraczyk/dotfiles"

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "Error: GNU Stow is not installed"
    echo "Install it with: brew install stow"
    exit 1
fi

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # Remove the default .zshrc created by Oh My Zsh
    rm -f "$HOME/.zshrc"
fi

cd "$DOTFILES_DIR" || exit 1

echo "Installing dotfiles with GNU Stow..."

# List of available packages
PACKAGES=("zsh" "git" "aerospace" "finicky" "oh-my-zsh" "karabiner" "zed")

# Stow each package
for package in "${PACKAGES[@]}"; do
    echo "Stowing $package..."
    stow "$package" -t "$HOME"
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
