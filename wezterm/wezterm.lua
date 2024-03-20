-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- and finally, return the configuration to wezterm
return {
  default_domain = 'WSL:Ubuntu-20.04',
  enable_tab_bar = false,
  font = wezterm.font 'PragmataPro Mono Liga',
  window_close_confirmation = 'NeverPrompt',
}
