# Dotfiles

A collection of configuration files for my development environment.

## Configurations

This repository contains configuration files for:

- **Neovim**: LazyVim-based configuration with custom plugins and keymaps
- **Lazygit**: Git terminal UI
- **Ghostty**: Modern terminal with rose-pine-moon theme
- **Wezterm**: Cross-platform terminal emulator with custom configuration
- **Zsh**: Shell configuration with Oh My Zsh, Powerlevel10k, and useful plugins
- **i3**: Tiling window manager with custom keybindings and status bar
- **Picom**: Compositor for X11 with custom visual effects

## Dependencies

### Neovim

- Neovim (0.9+)
- Git
- Ripgrep (for Telescope)
- npm/node.js (for LSP servers)
- Python 3 (for some plugins)
- A C compiler (for Treesitter)
- JetBrains Mono Nerd Font or any Nerd Font (for icons)

### Lazygit

- Lazygit
- Git

### Ghostty

- Ghostty terminal emulator
- Rose-pine-moon theme

### Wezterm

- Wezterm terminal emulator
- JetBrainsMono Nerd Font
- MesloLGS Nerd Font
- Source Han Sans font (for CJK support)

### Zsh

- Zsh
- Oh My Zsh
- Powerlevel10k theme
- zsh-autosuggestions plugin
- zsh-syntax-highlighting plugin
- eza (modern ls replacement)
- zoxide (better cd)
- NVM (Node Version Manager)
- SDKMAN (Java development tools)

### i3

- i3 window manager
- i3blocks status bar
- i3lock screen locker
- feh (for wallpaper)
- dmenu (application launcher)
- pipewire-pulse / pactl (audio control)
- playerctl (media controls)
- xbacklight (screen brightness)
- setxkbmap (keyboard layout)
- xrandr (screen settings)
- picom (compositor for visual effects)

### Picom

- picom compositor
- GLX backend support

## Installation

To deploy these dotfiles on a new system:

```bash
git clone https://github.com/rznn7/dotfiles.git
cd dotfiles
./setup.sh
```

The setup script will:

1. Install GNU Stow if not already present
2. Create the necessary directories
3. Back up any existing configuration files
4. Stow each configuration package

## Adding New Configurations

To add a new configuration:

1. Create a new directory for the application: `mkdir -p newapp/.config/newapp`
2. Copy configuration files: `cp -r ~/.config/newapp/* newapp/.config/newapp/`
3. Add the new application to the packages array in setup.sh
4. Stow the new configuration: `stow --no-folding newapp`
5. Commit the changes to the repository

## Customization

Feel free to modify any configuration file to suit your preferences:

- **Neovim**: Edit files in `nvim/.config/nvim/`
- **Terminal themes**: Change theme in `ghostty/.config/ghostty/config` or `wezterm/.wezterm.lua`
- **i3**: Modify keybindings in `i3/.config/i3/config`
- **Zsh**: Add aliases and functions to `zsh/.zshrc`

## License

This repository is licensed under the Apache License 2.0 - see the LICENSE file for details.
