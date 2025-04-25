# My Dotfiles

Configuration files for:
- Neovim
- Lazygit
- Ghostty
- Zsh
- i3 window manager
- Wezterm

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
- i3blocks
- i3lock
- feh (for wallpaper)
- dmenu
- pipewire-pulse / pactl (audio)
- playerctl (media controls)
- xbacklight (screen brightness)
- setxkbmap (keyboard layout)
- xrandr (screen settings)

### Wezterm
- Wezterm terminal emulator
- JetBrainsMono Nerd Font
- MesloLGS Nerd Font
- Source Han Sans font (for CJK support)
- Zsh

## Deployment

To deploy these dotfiles on a new system:

```bash
git clone https://github.com/rznn7/dotfiles.git
cd dotfiles
./setup.sh
```

## Adding new configurations

To add a new configuration:

1. Create a new directory for the application: `mkdir -p newapp/.config/newapp`
2. Copy configuration files: cp -r `~/.config/newapp/* newapp/.config/newapp/`
3. Add the new application to the packages array in setup.sh
4. Stow the new configuration: `stow --no-folding newapp`
5. Commit the changes to the repository
