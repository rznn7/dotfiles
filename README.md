# My Dotfiles

Configuration files for:
- Neovim
- Lazygit
- Ghostty
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
