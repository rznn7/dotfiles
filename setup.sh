#!/bin/bash
set -e

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "GNU Stow is not installed."
    
    if command -v apt &> /dev/null; then
        echo "Installing GNU Stow using apt..."
        sudo apt install -y stow
    elif command -v dnf &> /dev/null; then
        echo "Installing GNU Stow using dnf..."
        sudo dnf install -y stow
    elif command -v brew &> /dev/null; then
        echo "Installing GNU Stow using Homebrew..."
        brew install stow
    elif command -v pacman &> /dev/null; then
        echo "Installing GNU Stow using pacman..."
        sudo pacman -S --noconfirm stow
    else
        echo "Could not determine package manager. Please install GNU Stow manually."
        exit 1
    fi
fi

# Change to the directory where the script is located
cd "$(dirname "$0")"

# Array of packages to stow
packages=("nvim" "lazygit" "ghostty")

# Create ~/.config directory if it doesn't exist
mkdir -p ~/.config

# Backup existing configs if they exist
for package in "${packages[@]}"; do
    if [ -e "~/.config/$package" ] && [ ! -L "~/.config/$package" ]; then
        echo "Backing up existing ~/.config/$package to ~/.config/${package}.bak"
        mv "~/.config/$package" "~/.config/${package}.bak"
    fi
done

# Unstow if already stowed
for package in "${packages[@]}"; do
    echo "Unstowing $package if already stowed..."
    stow --no-folding -D "$package" 2>/dev/null || true
done

# Stow packages
for package in "${packages[@]}"; do
    echo "Stowing $package..."
    stow --no-folding "$package"
done

echo "Done! Configurations have been linked."
