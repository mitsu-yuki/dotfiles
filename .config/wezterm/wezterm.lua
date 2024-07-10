local wezterm = require "wezterm"
local config = wezterm.config_builder()

local mac = wezterm.target_triple:find("darwin")
-- window opacity
config.window_background_opacity = 0.83
config.window_padding = {
  bottom = 0.5
}
-- color theme
config.color_scheme = 'Catppuccin Mocha'

-- font setting
config.font_size = 12.0
config.font = wezterm.font('HackGen Console NFJ')
config.freetype_load_target = "Light"

if mac then
  config.font_size = 15.0
end

return config

