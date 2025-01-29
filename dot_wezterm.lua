local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

local font = wezterm.font("JetBrains Mono NF")

local my_github_dark = wezterm.color.get_builtin_schemes()["GitHub Dark"]
my_github_dark.background = "#0D1117"

-- Plugins
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

config = {
	color_schemes = {
		["GitHub Dark Default"] = {
			background = "#0D1117",
			foreground = "#b3b1ad",
			cursor_bg = "#B3B1AD",
			cursor_border = "#B3B1AD",
			cursor_fg = "#0D1117",
			selection_fg = "black",
			selection_bg = "#fffacd",
			scrollbar_thumb = "#222222",
			split = "#444444",
			ansi = {
				"#6e7681",
				"#ffa198",
				"#56d364",
				"#e3b341",
				"#79c0ff",
				"#d2a8ff",
				"#56d4dd",
				"#f0f6fc",
			},
			brights = {
				"#484f58",
				"#ff7b72",
				"#3fb950",
				"#d29922",
				"#58a6ff",
				"#bc8cff",
				"#39c5cf",
				"#b1bac4",
			},
			indexed = { [16] = "#d18616", [17] = "#ffa198" },
			copy_mode_active_highlight_bg = { Color = "#000000" },
			copy_mode_active_highlight_fg = { AnsiColor = "Black" },
			copy_mode_inactive_highlight_bg = { Color = "#52ad70" },
			copy_mode_inactive_highlight_fg = { AnsiColor = "White" },
			quick_select_label_bg = { Color = "peru" },
			quick_select_label_fg = { Color = "#ffffff" },
			quick_select_match_bg = { AnsiColor = "Navy" },
			quick_select_match_fg = { Color = "#ffffff" },
		},
	},
	color_scheme = "GitHub Dark Default",
	colors = {
		tab_bar = {
			background = "#010409",
			active_tab = {
				bg_color = "#0D1117",
				fg_color = "#ffffff",
			},
			new_tab = {
				bg_color = "#010409",
				fg_color = "#8E959C",
			},
			inactive_tab = {
				bg_color = "#010409",
				fg_color = "#8E959C",
			},
		},
	},
	window_frame = { font = font },
	window_close_confirmation = "AlwaysPrompt",
	font = font,
	font_size = 14,
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	keys = {
		{ key = "1", mods = "ALT", action = act.ActivateTab(0) },
		{ key = "2", mods = "ALT", action = act.ActivateTab(1) },
		{ key = "3", mods = "ALT", action = act.ActivateTab(2) },
		{ key = "4", mods = "ALT", action = act.ActivateTab(3) },
		{ key = "5", mods = "ALT", action = act.ActivateTab(4) },
		{ key = "6", mods = "ALT", action = act.ActivateTab(5) },
		{ key = "7", mods = "ALT", action = act.ActivateTab(6) },
		{ key = "8", mods = "ALT", action = act.ActivateTab(7) },
		{ key = "9", mods = "ALT", action = act.ActivateTab(8) },
		{ key = "0", mods = "ALT", action = act.ActivateTab(9) },
		{ key = "s", mods = "ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "v", mods = "ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },
		{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "R", mods = "CTRL", action = act.ReloadConfiguration },
		{ key = "T", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentPane({ confirm = false }) },
		{ key = "f", mods = "SHIFT|CTRL", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
		{ key = "Z", mods = "SHIFT|CTRL", action = wezterm.action.TogglePaneZoomState },
	},
}

smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },
	modifiers = { move = "CTRL" },
	log_level = "info",
  at_edge = "stop",
})

return config
