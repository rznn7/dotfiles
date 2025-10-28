# Dotfiles

A collection of configuration files for my development environment.

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
