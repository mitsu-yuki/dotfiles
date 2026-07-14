-- ## setup
local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

local mac = wezterm.target_triple:find("darwin")

-- ## general
config.use_ime = true
config.color_scheme = "Catppuccin Mocha"
config.warn_about_missing_glyphs = false

-- ##  window
config.window_background_opacity = 0.83
config.window_padding = {
  left = 2,
  bottom = 2,
}
config.window_content_alignment = {
  horizontal = "Left",
  vertical = "Bottom",
}
config.skip_close_confirmation_for_processes_named = {
  "bash",
  "sh",
  "zsh",
  "fish",
  "nu",
  "cmd.exe",
  "pwsh.exe",
  "powershell.exe",
}

-- ## tab
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.show_tab_index_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- ## font
config.font_size = 12.0
config.font = wezterm.font("HackGen Console NF")
config.freetype_load_target = "Light"
if mac then
  config.font_size = 15.0
  config.macos_window_background_blur = 20
end

-- ## key bind
-- Switch activate tab for ALT + Number key
config.keys = {}
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "ALT",
    action = act.ActivateTab(i - 1),
  })
end

return config
