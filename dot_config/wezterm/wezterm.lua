-- Pull in the wezterm API
local wezterm = require 'wezterm'
local wez = wezterm
local act = wez.action
local gui = wez.gui

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wez.config_builder then
  config = wez.config_builder()
end

----- COLOR SCHEME -----
local function get_appearance()
  if gui then
    return gui.get_appearance()
  end
  return 'Dark'
end
local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Bamboo V'
  else
    return 'Dayfox V'
  end
end
config.color_scheme = scheme_for_appearance(get_appearance())
-- Convenience for accessing colors from the current scheme
local current_scheme = wez.color.get_builtin_schemes()[config.color_scheme]
if not current_scheme then
  current_scheme = wez.color.load_scheme(wez.config_dir .. "/colors/" .. config.color_scheme .. ".toml")
end

----- FONT -----
config.font = wez.font_with_fallback {
  {
    family = 'FiraCode Nerd Font',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  },
  {
    family = 'Fira Code',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  },
  'Apple Color Emoji',
  'Symbols Nerd Font',
}
config.font_size = 11
config.underline_position = "300%"
config.underline_thickness = "500%"

----- TAB BAR -----
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

----- PANE -----
config.inactive_pane_hsb = {
  saturation = 0.7,
  brightness = 0.7,
}

----- WINDOW -----
---@diagnostic disable-next-line: unused-local
wez.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.8
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

----- BACKGROUND IMAGE -----
-- I'm leaving this here because it is funny, but I can't change the opacity with a hotkey
-- config.background = {
--   {
--     source = {
--       Color = current_scheme.background
--     },
--     width = '100%',
--     height = '100%',

--   },
--   {
--     source = {
--       File = wez.config_dir .. "/long.gif"
--     },
--     hsb = { brightness = 0.1 },
--     attachment = 'Scroll',
--     repeat_x = 'NoRepeat',
--     repeat_y = 'Repeat',
--   },
-- }

----- KEY BINDINGS -----
config.keys = {
  ----- PANES -----
  -- Create and destroy panes
  { key = 'v',     mods = 'SUPER|SHIFT',      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'c',     mods = 'SUPER|SHIFT',      action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'a',     mods = 'SUPER|SHIFT',      action = act.SplitPane { direction = 'Down', size = { Cells = 20 }, }, },
  { key = 'x',     mods = 'SUPER|SHIFT',      action = act.CloseCurrentPane { confirm = true }, },
  -- Move between panes
  { key = 'h',     mods = 'SUPER|SHIFT',      action = act.ActivatePaneDirection 'Left', },
  { key = 'j',     mods = 'SUPER|SHIFT',      action = act.ActivatePaneDirection 'Down', },
  { key = 'k',     mods = 'SUPER|SHIFT',      action = act.ActivatePaneDirection 'Up', },
  { key = 'l',     mods = 'SUPER|SHIFT',      action = act.ActivatePaneDirection 'Right', },
  { key = 'b',     mods = 'SUPER|SHIFT',      action = act.PaneSelect, },
  -- Resize panes
  { key = 'h',     mods = 'SUPER|SHIFT|CTRL', action = act.AdjustPaneSize { 'Left', 5 }, },
  { key = 'j',     mods = 'SUPER|SHIFT|CTRL', action = act.AdjustPaneSize { 'Down', 5 }, },
  { key = 'k',     mods = 'SUPER|SHIFT|CTRL', action = act.AdjustPaneSize { 'Up', 5 }, },
  { key = 'l',     mods = 'SUPER|SHIFT|CTRL', action = act.AdjustPaneSize { 'Right', 5 }, },
  { key = 'z',     mods = 'SUPER|SHIFT',      action = act.TogglePaneZoomState, },
  -- Rotate panes
  { key = 'n',     mods = 'SUPER|SHIFT',      action = act.RotatePanes 'Clockwise' },
  { key = 'm',     mods = 'SUPER|SHIFT',      action = act.RotatePanes 'CounterClockwise' },
  ----- OTHER KEYBINDINGS -----
  -- Tabs
  { key = '[',     mods = 'SUPER|SHIFT|CTRL', action = act.MoveTabRelative(-1) },
  { key = ']',     mods = 'SUPER|SHIFT|CTRL', action = act.MoveTabRelative(1) },
  -- Misc
  { key = 'p',     mods = 'SUPER|SHIFT',      action = act.ActivateCommandPalette, },
  { key = 'u',     mods = 'SUPER|SHIFT',      action = act.CharSelect },
  { key = ' ',     mods = 'SUPER|SHIFT',      action = act.QuickSelect, },
  { key = 'f',     mods = 'SUPER|SHIFT',      action = act.ActivateCopyMode, },
  { key = 'u',     mods = 'SUPER',            action = act.EmitEvent 'toggle-opacity', },
  { key = 'Enter', mods = 'SUPER',            action = act.ToggleFullScreen, },
  ------ UNBIND KEYS -----
  { key = 'Enter', mods = 'META',             action = act.DisableDefaultAssignment, },
}

----- RIGHT STATUS BAR -----
wez.on('update-right-status', function(window, pane)
  -- Each element holds the text for a cell in a "powerline" style << fade
  local cells = {}

  -- Figure out the cwd and host of the current pane.
  -- This will pick up the hostname for the remote host if your
  -- shell is using OSC 7 on the remote host.
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    local cwd = ''
    local hostname = ''

    if type(cwd_uri) == 'userdata' then
      -- Running on a newer version of wezterm and we have
      -- a URL object here, making this simple!

      ---@diagnostic disable-next-line: undefined-field
      cwd = cwd_uri.file_path
      ---@diagnostic disable-next-line: undefined-field
      hostname = wezterm.hostname() or cwd_uri.host
    else
      -- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
      -- which doesn't have the Url object
      cwd_uri = cwd_uri:sub(8)
      local slash = cwd_uri:find '/'
      if slash then
        hostname = cwd_uri:sub(1, slash - 1)
        -- and extract the cwd from the uri, decoding %-encoding
        cwd = cwd_uri:sub(slash):gsub('%%(%x%x)', function(hex)
          return string.char(tonumber(hex, 16))
        end)
      end
    end

    -- Remove the domain name portion of the hostname
    local dot = hostname:find '[.]'
    if dot then
      hostname = hostname:sub(1, dot - 1)
    end
    if hostname == '' then
      hostname = wezterm.hostname()
    end

    table.insert(cells, cwd)
    table.insert(cells, hostname)
  end

  -- I like my date/time in this style: "Wed Mar 3 08:14"
  local date = wez.strftime '%a %b %-d %H:%M'
  table.insert(cells, date)

  -- An entry for each battery (typically 0 or 1 battery)
  for _, b in ipairs(wez.battery_info()) do
    table.insert(cells, string.format('%.0f%%', b.state_of_charge * 100))
  end

  -- Background color
  local text_bg = current_scheme.tab_bar.active_tab.bg_color

  -- Foreground color
  local text_fg = current_scheme.tab_bar.active_tab.fg_color or current_scheme.foreground

  -- The elements to be formatted
  local elements = {}
  -- How many cells have been formatted
  local num_cells = 0

  -- Translate a cell into elements
  local function push(text, is_last)
    table.insert(elements, { Foreground = { Color = text_fg } })
    table.insert(elements, { Background = { Color = text_bg } })
    table.insert(elements, { Text = ' ' .. text .. ' ' })
    if not is_last then
      table.insert(elements, { Foreground = { Color = text_bg } })
    end
    num_cells = num_cells + 1
  end

  while #cells > 0 do
    local cell = table.remove(cells, 1)
    push(cell, #cells == 0)
  end

  window:set_right_status(wez.format(elements))
end)

-- Neovim zen-mode.nvim integration
wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while (number_value > 0) do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
end)

-- and finally, return the configuration to wezterm
return config
