-- ## setup
local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

local mac = wezterm.target_triple:find("darwin")

-- ## general
config.use_ime = true
config.color_scheme = "Catppuccin Mocha"
config.warn_about_missing_glyphs = false
-- ### color palette Catppuccin Mocha (bubble tab bar)
local mocha = {
  mantle = "#181825",
  surface0 = "#313244",
  surface1 = "#45475a",
  base = "#1e1e2e",
  text = "#cdd6f4",
  subtext0 = "#a6adc8",
  blue = "#89b4fa",
}

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
config.use_fancy_tab_bar = false
config.tab_max_width = 32

config.colors = {
  tab_bar = {
    background = mocha.mantle,
  },
}

local BUBBLE_LEFT = wezterm.nerdfonts.ple_left_half_circle_thick
local BUBBLE_RIGHT = wezterm.nerdfonts.ple_right_half_circle_thick

-- ssh options that consume the following argv item as their value
local SSH_OPTS_WITH_ARG = {
  p = true,
  l = true,
  i = true,
  F = true,
  o = true,
  J = true,
  L = true,
  R = true,
  D = true,
  W = true,
  w = true,
  B = true,
  b = true,
  c = true,
  E = true,
  e = true,
  I = true,
  m = true,
  O = true,
  Q = true,
  S = true,
}

local function ssh_target(argv)
  local i = 2
  while i <= #argv do
    local arg = argv[i]
    if arg:sub(1, 1) == "-" then
      if #arg == 2 and SSH_OPTS_WITH_ARG[arg:sub(2, 2)] then
        i = i + 2
      else
        i = i + 1
      end
    else
      return arg
    end
  end
  return nil
end

-- returns the ssh target if the foreground process is ssh, otherwise nil
local function remote_host(proc)
  if not (proc and proc.argv and proc.argv[1]) then
    return nil
  end
  local exe = (proc.executable or ""):match("([^/\\]+)$") or proc.argv[1]:gsub("^%-", "")
  if exe ~= "ssh" then
    return nil
  end
  local target = ssh_target(proc.argv)
  if not target then
    return nil
  end
  return target:match("@(.+)$") or target
end

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end

  local pane_info = tab_info.active_pane
  local pane = wezterm.mux.get_pane(pane_info.pane_id)
  if pane then
    local host = remote_host(pane:get_foreground_process_info())
    if host then
      return host
    end
  end

  return wezterm.hostname()
end

wezterm.on("format-tab-title", function(tab, _tabs, _panes, _config, hover, max_width)
  local bg = mocha.surface0
  local fg = mocha.subtext0

  if tab.is_active then
    bg = mocha.blue
    fg = mocha.base
  elseif hover then
    bg = mocha.surface1
    fg = mocha.text
  end

  -- reserve 2 cells for the bubble caps and 2 for the padding spaces
  local title = wezterm.truncate_right(tab_title(tab), max_width - 4)

  return {
    { Background = { Color = mocha.mantle } },
    { Foreground = { Color = bg } },
    { Text = BUBBLE_LEFT },
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = " " .. title .. " " },
    { Background = { Color = mocha.mantle } },
    { Foreground = { Color = bg } },
    { Text = BUBBLE_RIGHT },
  }
end)

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
