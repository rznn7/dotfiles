local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 14
-- config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font = wezterm.font("JetBrains Mono")
config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"
config.color_scheme = 'rose-pine'
config.window_background_opacity = 0.98

return config
