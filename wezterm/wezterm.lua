local wezterm = require("wezterm")

-- Load configuration modules
local window = require("window")
local colors = require("colors")
local font = require("font")
local keybindings = require("keybindings")
local mousebindings = require("mousebindings")
local launch_menu = require("launch_menu")
local tab_title = require("tab_title")

local config = {
    check_for_updates = true,
    disable_default_key_bindings = true,
    initial_cols = 130,
    initial_rows = 30,
    exit_behavior = "Close",
    default_prog = { 'pwsh.exe', '-NoLogo' },
    tab_bar_at_bottom = false,
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = false,
    set_environment_variables = {},
}

-- Merge configurations from modules
for k, v in pairs(window) do config[k] = v end
for k, v in pairs(colors) do config[k] = v end
for k, v in pairs(font) do config[k] = v end
for k, v in pairs(keybindings) do config[k] = v end
for k, v in pairs(mousebindings) do config[k] = v end
for k, v in pairs(launch_menu) do config[k] = v end

-- Configure the tab title formatting
wezterm.on("format-tab-title", tab_title)

return config
