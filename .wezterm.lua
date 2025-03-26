local wezterm = require 'wezterm'

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Basic configuration
-- config.font_size = 20
-- config.default_prog = { "/usr/bin/fish" }
config.use_fancy_tab_bar = false  -- Enable fancy tab bar
config.hide_tab_bar_if_only_one_tab = true  -- Hide tab bar if only one tab
config.enable_scroll_bar = true  -- Enable scroll bar

config.default_cursor_style = 'SteadyBar'
-- config.window_decorations = "NONE"
-- config.integrated_title_button_style = "Gnome"
config.window_background_opacity = 0.8

-- Define light-mode tab bar colors (used as defaults)
config.colors = config.colors or {}


-- Define the default window frame settings.
config.window_frame = {
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },
  font_size = 15.0,
  active_titlebar_bg = '#333333',
  inactive_titlebar_bg = '#333333',
}

-- Register color schemes
config.color_schemes = {
  ['My CLRS'] = wezterm.color.get_builtin_schemes()['CLRS'],
}

-- Function to choose a color scheme based on appearance.
function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Wez'  -- Dark theme
  else
    return 'My CLRS'  -- Our custom light scheme
  end
end

-- Predefined tab bar color definitions for light and dark modes
local light_tab_bar = {
  background = '#F5F5F5',
  active_tab = {
    bg_color = '#FFFFFF',
    fg_color = '#333333',
    intensity = 'Normal',
    underline = 'None',
    italic = false,
    strikethrough = false,
  },
  inactive_tab = {
    bg_color = '#E0E0E0',
    fg_color = '#666666',
  },
  inactive_tab_hover = {
    bg_color = '#D3D3D3',
    fg_color = '#555555',
    italic = true,
  },
  new_tab = {
    bg_color = '#E0E0E0',
    fg_color = '#666666',
  },
  new_tab_hover = {
    bg_color = '#D3D3D3',
    fg_color = '#555555',
    italic = true,
  },
}

local dark_tab_bar = {
  background = '#333333',  -- Dark background for the tab bar area
  active_tab = {
    bg_color = '#222222',  -- Darker active tab
    fg_color = '#FFFFFF',  -- White text for contrast
    intensity = 'Normal',
    underline = 'None',
    italic = false,
    strikethrough = false,
  },
  inactive_tab = {
    bg_color = '#2d2d2d',  -- Slightly lighter than the background
    fg_color = '#AAAAAA',
  },
  inactive_tab_hover = {
    bg_color = '#3d3d3d',
    fg_color = '#CCCCCC',
    italic = true,
  },
  new_tab = {
    bg_color = '#2d2d2d',
    fg_color = '#AAAAAA',
  },
  new_tab_hover = {
    bg_color = '#3d3d3d',
    fg_color = '#CCCCCC',
    italic = true,
  },
}

-- Callback to update configuration based on system appearance
wezterm.on('window-config-reloaded', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)

  -- Set the color scheme override
  overrides.color_scheme = scheme

  -- Dynamically update window frame and tab bar colors.
  -- Also include font settings for the window frame.
  if appearance:find 'Dark' then
    overrides.window_frame = {
      font = wezterm.font { family = 'Roboto', weight = 'Bold' },
      font_size = 15.0,
      active_titlebar_bg = '#333333',
      inactive_titlebar_bg = '#333333',
    }
    overrides.colors = overrides.colors or {}
    overrides.colors.tab_bar = dark_tab_bar
  else
    overrides.window_frame = {
      font = wezterm.font { family = 'Roboto', weight = 'Bold' },
      font_size = 15.0,
      active_titlebar_bg = '#F5F5F5',
      inactive_titlebar_bg = '#F5F5F5',
    }
    overrides.colors = overrides.colors or {}
    overrides.colors.tab_bar = light_tab_bar
  end

  window:set_config_overrides(overrides)
end)

-- Key bindings for tab management
local act = wezterm.action
config.keys = {}

-- ALT+1 to ALT+8 to switch tabs
for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = act.ActivateTab(i - 1),
  })
end

-- CTRL+ALT+1 to CTRL+ALT+8 to move tabs
for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|ALT',
    action = act.MoveTab(i - 1),
  })
end

-- Custom key to move pane to new window
table.insert(config.keys, {
  key = 'z',
  mods = 'CTRL|ALT',
  action = wezterm.action_callback(function(win, pane)
    pane:move_to_new_window()
  end),
})

-- Disable ALT+Enter default binding
table.insert(config.keys, {
  key = 'Enter',
  mods = 'ALT',
  action = wezterm.action.DisableDefaultAssignment,
})

return config
