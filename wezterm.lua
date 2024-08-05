local wezterm = require("wezterm")
local lib = require("config.init")


-- Load configuration modules
local window = lib.window
local colors = lib.colors
local font = lib.font
local keybindings = lib.keybindings
local mousebindings = lib.mousebindings
local launch_menu = lib.launch_menu
local tab_title = lib.tab_title

local config = {
    check_for_updates = true,
    disable_default_key_bindings = true,
    initial_cols = 130,
    initial_rows = 30,
    exit_behavior = "Close",
    default_prog = { 'pwsh.exe', '-NoLogo' },
    tab_bar_at_bottom = false,
    use_fancy_tab_bar = true,
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
