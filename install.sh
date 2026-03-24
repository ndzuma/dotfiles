#!/bin/bash

# Get the directory where the script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

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
