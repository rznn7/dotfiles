#!/bin/bash
set -e

# Check if stow is installed
if ! command -v stow &>/dev/null; then
  echo "GNU Stow is not installed."

  if command -v apt &>/dev/null; then
    echo "Installing GNU Stow using apt..."
    sudo apt install -y stow
  elif command -v dnf &>/dev/null; then
    echo "Installing GNU Stow using dnf..."
    sudo dnf install -y stow
  elif command -v brew &>/dev/null; then
    echo "Installing GNU Stow using Homebrew..."
    brew install stow
  elif command -v pacman &>/dev/null; then
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
packages=("nvim" "lazygit" "ghostty" "wezterm" "zsh" "i3" "picom" "dunst")

# Create ~/.config directory if it doesn't exist
mkdir -p ~/.config

# Backup existing configs if they exist
for package in "${packages[@]}"; do
  # Check for files in package directory and create backups if needed
  if [ -d "$package" ]; then
    find "$package" -type f -o -type l | while read -r file; do
      # Get the relative path within the package
      rel_path="${file#$package/}"
      # Target path in home directory
      target_path="$HOME/$rel_path"

      # If the target exists and is not a symlink, back it up
      if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
        echo "Backing up existing $target_path to ${target_path}.bak"
        mv "$target_path" "${target_path}.bak"
      fi
    done
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
