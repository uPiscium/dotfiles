-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night"
config.font_size = 10.0
config.warn_about_missing_glyphs = false
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Nerd Font Symbols",
	"HackGen Console NFJ",
	"Noto Color Emoji",
})
config.inactive_pane_hsb = {
	saturation = 0.8,
}
config.enable_scroll_bar = true
config.colors = {
	scrollbar_thumb = "#ff3333",
}
return config
