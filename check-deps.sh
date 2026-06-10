#!/usr/bin/env bash
# Check required programs referenced by these dotfiles.
# Usage: ./check-deps.sh [-a]
#   -a   show all checked items (✓/✗), not just missing.

set -u

show_all=0
[[ "${1:-}" == "-a" ]] && show_all=1

# category|prog1 prog2 ...
required=(
  "core|stow git"
  "sway|sway swayidle swaylock swaymsg kanshi autotiling nm-applet dunst dbus-update-activation-environment jq"
  "bar/launcher|waybar rofi"
  "terminal/shell|wezterm zsh starship zoxide eza mise"
  "apps|firefox thunar notify-send cal"
  "screenshot/clipboard|grim slurp wl-copy xclip"
  "audio/media/brightness|pactl pavucontrol playerctl brightnessctl"
  "file-manager|yazi"
  "editor|nvim"
  "neovim-deps|rg fd tree-sitter node npm prettier eslint stylua shellcheck shfmt flake8"
  "git-tui|lazygit"
)

optional=(
  "optional-bin|brew pnpm neovide godot sonarlint-language-server google-java-format"
)

# optional files (not on PATH): label:path
optional_files=(
  "nvm:$HOME/.nvm/nvm.sh"
  "sdkman:$HOME/.sdkman/bin/sdkman-init.sh"
)

total=0
missing_total=0
opt_total=0
opt_missing_total=0
declare -a out_required
declare -a out_optional

check_group() {
  local label="$1" progs="$2" kind="$3"
  local -a miss=() found=()
  for p in $progs; do
    if [[ "$kind" == required ]]; then total=$((total+1)); else opt_total=$((opt_total+1)); fi
    if command -v "$p" >/dev/null 2>&1; then
      found+=("$p")
    else
      miss+=("$p")
      if [[ "$kind" == required ]]; then missing_total=$((missing_total+1)); else opt_missing_total=$((opt_missing_total+1)); fi
    fi
  done

  if (( show_all )); then
    local line="  [$label]"
    for p in "${found[@]}"; do line+=" ✓$p"; done
    for p in "${miss[@]}"; do line+=" ✗$p"; done
    if [[ "$kind" == required ]]; then out_required+=("$line"); else out_optional+=("$line"); fi
  else
    if (( ${#miss[@]} > 0 )); then
      local line
      printf -v line "  [%s] %s" "$label" "$(IFS=', '; echo "${miss[*]}")"
      if [[ "$kind" == required ]]; then out_required+=("$line"); else out_optional+=("$line"); fi
    fi
  fi
}

for entry in "${required[@]}"; do
  check_group "${entry%%|*}" "${entry#*|}" required
done

for entry in "${optional[@]}"; do
  check_group "${entry%%|*}" "${entry#*|}" optional
done

# optional files
declare -a opt_file_lines
for entry in "${optional_files[@]}"; do
  label="${entry%%:*}"; path="${entry#*:}"
  opt_total=$((opt_total+1))
  if [[ -f "$path" ]]; then
    (( show_all )) && opt_file_lines+=("  [$label] ✓$path")
  else
    opt_missing_total=$((opt_missing_total+1))
    if (( show_all )); then
      opt_file_lines+=("  [$label] ✗$path")
    else
      opt_file_lines+=("  [$label] $path")
    fi
  fi
done

if (( show_all )); then
  echo "All checked:"
  printf '%s\n' "${out_required[@]}"
  echo
  echo "Optional:"
  printf '%s\n' "${out_optional[@]}"
  (( ${#opt_file_lines[@]} > 0 )) && printf '%s\n' "${opt_file_lines[@]}"
  echo
elif (( ${#out_required[@]} > 0 || ${#out_optional[@]} > 0 || ${#opt_file_lines[@]} > 0 )); then
  if (( ${#out_required[@]} > 0 )); then
    echo "Missing dependencies:"
    echo
    printf '%s\n' "${out_required[@]}"
    echo
  fi
  if (( ${#out_optional[@]} > 0 || ${#opt_file_lines[@]} > 0 )); then
    echo "Missing optional:"
    echo
    (( ${#out_optional[@]} > 0 )) && printf '%s\n' "${out_optional[@]}"
    (( ${#opt_file_lines[@]} > 0 )) && printf '%s\n' "${opt_file_lines[@]}"
    echo
  fi
else
  echo "All dependencies present ($total checked, $opt_total optional)."
fi

echo "Summary: $missing_total missing / $total checked, $opt_missing_total optional missing / $opt_total optional"

(( missing_total > 0 )) && exit 1 || exit 0
