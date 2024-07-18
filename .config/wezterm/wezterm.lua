local wezterm = require "wezterm"
local act = wezterm.action
local config = wezterm.config_builder()

local mac = wezterm.target_triple:find("darwin")

-- window opacity
config.window_background_opacity = 0.83
config.window_padding = {
  bottom = 0
}

-- window close alert
-- default setting
config.skip_close_confirmation_for_processes_named = {
  'bash',
  'sh',
  'zsh',
  'fish',
  --'tmux',
  'nu',
  'cmd.exe',
  'pwsh.exe',
  'powershell.exe',
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

-- key bind
-- Swtich activate tab for ALT + Number key
config.keys = {}
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "ALT",
    action = act.ActivateTab(i - 1)
  })
end
return config

