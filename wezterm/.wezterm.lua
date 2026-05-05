local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "/usr/bin/zsh" }
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_tab_index_in_tab_bar = true
config.tab_and_split_indices_are_zero_based = true

-- Tab bar: rose-pine palette
config.colors = {
	tab_bar = {
		background = "#191724",
		active_tab = {
			bg_color = "#26233a",
			fg_color = "#e0def4",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#191724",
			fg_color = "#6e6a86",
		},
		inactive_tab_hover = {
			bg_color = "#1f1d2e",
			fg_color = "#908caa",
		},
		new_tab = {
			bg_color = "#191724",
			fg_color = "#6e6a86",
		},
		new_tab_hover = {
			bg_color = "#1f1d2e",
			fg_color = "#ebbcba",
		},
	},
}

-- Tab title: "[idx] pane-title" (xwindow-style, like polybar)
wezterm.on("format-tab-title", function(tab)
	return string.format(" %d:%s ", tab.tab_index, tab.active_pane.title or "")
end)
config.color_scheme = "rose-pine"
config.font_size = 13.1
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font Mono", weight = "Medium" },
	"MesloLGS Nerd Font Mono",
	"SFMono",
	"Source Han Sans",
	"Noto Color Emoji",
})
config.line_height = 1.1
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

-- Dev session: nvim, claude, run, test in current cwd
-- Big screen (>= 2000px wide): nvim+claude split in tab 0, run/test in tabs 1/2
-- Small screen: 4 separate tabs
local DEV_WIDE_THRESHOLD = 2000

wezterm.on("trigger-dev-tabs", function(window, pane)
	local cwd = pane:get_current_working_dir()
	if cwd then
		cwd = cwd.file_path
	end

	local mux_win = window:mux_window()
	local dims = window:get_dimensions()
	local wide = dims.pixel_width >= DEV_WIDE_THRESHOLD

	pane:send_text("nvim\n")

	if wide then
		local claude_pane = pane:split({ direction = "Right", size = 0.45, cwd = cwd })
		claude_pane:send_text("claude\n")
	else
		local _, claude_pane = mux_win:spawn_tab({ cwd = cwd })
		claude_pane:send_text("claude\n")
	end

	mux_win:spawn_tab({ cwd = cwd })
	mux_win:spawn_tab({ cwd = cwd })

	-- Focus first tab after init
	mux_win:tabs()[1]:activate()
	pane:activate()
end)

-- Keybindings
config.keys = {
	-- Your existing shortcuts
	{
		key = "d",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("trigger-dev-tabs"),
	},

	-- Pane navigation (more ergonomic)
	{
		key = "n",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "o",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "i",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "e",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	-- Pane resizing
	{
		key = "n",
		mods = "ALT|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "o",
		mods = "ALT|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "i",
		mods = "ALT|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "e",
		mods = "ALT|CTRL",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},

	-- Tab switching: Alt+Ctrl+1..4
	{ key = "0", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(0) },
	{ key = "1", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(1) },
	{ key = "2", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(2) },
	{ key = "3", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(3) },
	{ key = "4", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(4) },
	{ key = "5", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(5) },
	{ key = "6", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(6) },
	{ key = "7", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(7) },
	{ key = "8", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(8) },
	{ key = "9", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(9) },

	-- Relative tab nav
	{ key = "[", mods = "ALT|CTRL", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "]", mods = "ALT|CTRL", action = wezterm.action.ActivateTabRelative(1) },

	-- New tab in cwd
	{ key = "t", mods = "ALT|CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain") },

	-- Close tab (with confirm)
	{ key = "w", mods = "ALT|CTRL", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
}

return config
