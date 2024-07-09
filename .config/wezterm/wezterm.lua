local wezterm = require "wezterm"
local config = wezterm.config_builder()

-- window opacity
config.window_background_opacity = 0.9

-- color theme
config.color_scheme = 'Catppuccin Mocha'

-- font setting
config.font_size = 14.0
wezterm.font = wezterm.font('HackGen35 Console NFJ')

return config
