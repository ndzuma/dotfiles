#!/bin/bash

# Get the directory where the script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macOS detected. You can install missing tools via Homebrew:"
    echo "brew install zsh tmux fzf btop starship zsh-autosuggestions zsh-autocomplete eza"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux detected."
    # Optionally prompt to install via apt
    read -p "Do you want to run apt to install required packages? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo apt update
        sudo apt install -y git zsh tmux fzf btop curl zsh-autosuggestions
        if ! command -v starship &> /dev/null; then
            echo "Installing starship..."
            curl -sS https://starship.rs/install.sh | sh
        fi
        # eza isn't always in apt by default, but we can let them know
        echo "Note: 'eza' (for the ls alias) might need to be installed manually if not available via apt."
    fi
fi

# Symlink home files
ln -sf "$DOTFILES_DIR/home/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/home/.zshenv" ~/.zshenv
ln -sf "$DOTFILES_DIR/home/.tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/home/.fzf.zsh" ~/.fzf.zsh
ln -sf "$DOTFILES_DIR/home/.fzf.bash" ~/.fzf.bash

# Symlink config files
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/config/starship.toml" ~/.config/starship.toml
ln -sfn "$DOTFILES_DIR/config/btop" ~/.config/btop

echo "Dotfiles installed successfully! Remember to install any required tools (starship, tmux, btop, fzf)."
