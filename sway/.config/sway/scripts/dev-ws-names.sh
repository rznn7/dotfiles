#!/usr/bin/env bash
# Label sway workspaces with the project of any wezterm dev session they hold.
#
# A wezterm window running the dev setup reports its OS title as
# "wezdev:<project>" (see ~/.wezterm.lua). For each workspace that contains
# such a window this renames the workspace to "<num>: <project>"; workspaces
# without one are reset to plain "<num>". The numeric prefix is preserved, so
# `workspace number N` bindings keep working.
#
# Started once from the sway config (exec). Reconciles on every window /
# workspace IPC event.

reconcile() {
  swaymsg -t get_tree 2>/dev/null | jq -r '
    [.. | select(.type? == "workspace")][]
    | { num: .num, name: .name,
        proj: ([ .. | select(.app_id? == "org.wezfurlong.wezterm") | .name // empty
                 | select(startswith("wezdev:")) ] | first // "")
      }
    | [.num, .name, .proj] | @tsv
  ' 2>/dev/null | while IFS=$'\t' read -r num name proj; do
    # only manage numbered workspaces (skip scratchpad / named ones)
    case "$num" in
      '' | *[!0-9]*) continue ;;
    esac

    if [ -n "$proj" ]; then
      desired="${num}: ${proj#wezdev:}"
    else
      desired="$num"
    fi

    if [ "$name" != "$desired" ]; then
      swaymsg "rename workspace \"$name\" to \"$desired\"" >/dev/null 2>&1
    fi
  done
}

reconcile
swaymsg -t subscribe -m '["window","workspace"]' 2>/dev/null | while read -r _; do
  reconcile
done
