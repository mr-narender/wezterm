-- Load configuration modules
local window = require("config.window")
local colors = require("config.colors")
local font = require("config.font")
local keybindings = require("config.keybindings")
local mousebindings = require("config.mousebindings")
local launch_menu = require("config.launch_menu")
local tab_title = require("config.tab_title")

return {
    window = window,
    colors = colors,
    font = font,
    keybindings = keybindings,
    mousebindings = mousebindings,
    launch_menu = launch_menu,
    tab_title = tab_title,
}
