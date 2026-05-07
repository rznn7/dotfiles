# Custom PATH additions
export PATH=$PATH:/home/POLYSPOT/gjestin/zig/0.13.0/files
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt autocd
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

alias l='ls -lah'      # long, all files, human-readable sizes
alias ll='ls -lh'      # long, human-readable sizes
alias la='ls -lAh'     # long, all except . and ..
alias ls='eza'

# zoxide (better cd)
eval "$(zoxide init zsh)"
alias cd="z"

# nvim alias
alias n="nvim"

# neovide alias
alias neovide="neovide &"

# copy to clipboard
alias xc="xclip -selection clipboard"
alias xcw="wl-copy"

# environment variables and tools
export CHROME_BIN=/usr/bin/chromium

# Homebrew setup - only run if brew exists
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ -d "$HOME/.linuxbrew" ]; then
  eval "$($HOME/.linuxbrew/bin/brew shellenv)"
elif [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

DOTFILES="$(dirname "$(realpath "${(%):-%x}")")"
source "$DOTFILES/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$DOTFILES/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export VISUAL=nvim
export EDITOR="$VISUAL"

# pnpm
export PNPM_HOME="/home/rznn/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# gdvm
export PATH="/home/rznn/.gdvm/bin/current_godot:/home/rznn/.gdvm/bin:$PATH"
# gdvm end

# opencode
export PATH=/home/POLYSPOT/gjestin/.opencode/bin:$PATH

# starship
eval "$(starship init zsh)"

# mise
eval "$(mise activate zsh)"

# sdkman (keep at end of file)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# sdkman end


# opencode
export PATH=/home/rznn/.opencode/bin:$PATH
