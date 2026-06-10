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
config.font_size = 14
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font Mono" },
	"MesloLGS Nerd Font Mono",
	"SFMono",
	"Source Han Sans",
	"Noto Color Emoji",
})
config.line_height = 1
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Dev session: nvim, claude, run, test in current cwd
-- Big screen (>= 3000px wide): nvim+claude split in tab 0, run/test in tabs 1/2
-- Small screen: 4 separate tabs
local DEV_WIDE_THRESHOLD = 3000

wezterm.on("trigger-dev-tabs", function(window, pane)
	local cwd = pane:get_current_working_dir()
	if cwd then
		cwd = cwd.file_path
	end

	-- Project name = basename of the dev cwd. Record every pane we spawn in a
	-- GLOBAL pane-id -> project map so the OS window title (see
	-- format-window-title) reports "wezdev:<project>", which the sway
	-- workspace-name daemon reads to label the workspace. (This wezterm version
	-- has no pane:set_user_var, so GLOBAL is the portable mechanism.)
	local project = cwd and cwd:gsub("/+$", ""):match("([^/]+)$") or ""

	local mux_win = window:mux_window()
	local dims = window:get_dimensions()
	local wide = dims.pixel_width >= DEV_WIDE_THRESHOLD

	local dev_panes = wezterm.GLOBAL.dev_panes or {}
	local function mark(p)
		dev_panes[tostring(p:pane_id())] = project
	end

	mark(pane)
	pane:send_text("nvim\n")

	if wide then
		local claude_pane = pane:split({ direction = "Left", size = 0.45, cwd = cwd })
		mark(claude_pane)
		claude_pane:send_text("claude\n")
	else
		local _, claude_pane = mux_win:spawn_tab({ cwd = cwd })
		mark(claude_pane)
		claude_pane:send_text("claude\n")
	end

	local _, run_pane = mux_win:spawn_tab({ cwd = cwd })
	mark(run_pane)

	wezterm.GLOBAL.dev_panes = dev_panes

	-- Focus first tab after init
	mux_win:tabs()[1]:activate()
	pane:activate()
end)

-- OS window title: when the active pane belongs to a dev session, expose the
-- project as "wezdev:<project>" so window managers can read it. Otherwise fall
-- back to the active pane's own title.
wezterm.on("format-window-title", function(tab, pane)
	local map = wezterm.GLOBAL.dev_panes or {}
	local proj = map[tostring(pane.pane_id)]
	if proj and proj ~= "" then
		return "wezdev:" .. proj
	end
	return pane.title or "wezterm"
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

	-- Tab switching: Alt+Ctrl+[space,x,c,d,r,s,t,w,f,p] -> tabs 0..9
	{ key = " ", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(0) },
	{ key = "x", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(1) },
	{ key = "c", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(2) },
	{ key = "d", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(3) },
	{ key = "r", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(4) },
	{ key = "s", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(5) },
	{ key = "t", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(6) },
	{ key = "w", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(7) },
	{ key = "f", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(8) },
	{ key = "p", mods = "ALT|CTRL", action = wezterm.action.ActivateTab(9) },

	-- Relative tab nav
	{ key = "[", mods = "ALT|CTRL", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "]", mods = "ALT|CTRL", action = wezterm.action.ActivateTabRelative(1) },

	-- New tab in cwd
	{ key = "t", mods = "ALT|CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain") },

	-- Close tab (with confirm)
	{ key = "w", mods = "ALT|CTRL", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
}

return config
