local wezterm = require("wezterm")

local keybindings = {
    keys = {{
        key = "q",
        mods = "CTRL",
        action = wezterm.action.QuitApplication
    }, {
        key = "w",
        mods = "CTRL",
        action = wezterm.action.CloseCurrentTab {
            confirm = false
        }
    }, {
        key = "_",
        mods = "SHIFT|ALT",
        action = wezterm.action.SplitVertical({
            domain = "CurrentPaneDomain"
        })
    }, {
        key = "+",
        mods = "SHIFT|ALT",
        action = wezterm.action.SplitHorizontal({
            domain = "CurrentPaneDomain"
        })
    }, {
        key = "Tab",
        mods = "SHIFT|CTRL",
        action = wezterm.action.ActivateTabRelative(1)
    }, {
        key = "F11",
        mods = "NONE",
        action = wezterm.action.ToggleFullScreen
    }, {
        key = "+",
        mods = "SHIFT|CTRL",
        action = wezterm.action.IncreaseFontSize
    }, {
        key = "-",
        mods = "SHIFT|CTRL",
        action = wezterm.action.DecreaseFontSize
    }, {
        key = "C",
        mods = "SHIFT|CTRL",
        action = wezterm.action.CopyTo "Clipboard"
    }, {
        key = "N",
        mods = "SHIFT|CTRL",
        action = wezterm.action.SpawnWindow
    }, {
        key = "T",
        mods = "SHIFT|CTRL",
        action = wezterm.action.ShowLauncher
    }, {
        key = "Enter",
        mods = "SHIFT|CTRL",
        action = wezterm.action.ShowLauncherArgs {
            flags = "FUZZY|TABS|LAUNCH_MENU_ITEMS"
        }
    }, {
        key = "V",
        mods = "SHIFT|CTRL",
        action = wezterm.action.PasteFrom "Clipboard"
    }, {
        key = "W",
        mods = "SHIFT|CTRL",
        action = wezterm.action.CloseCurrentTab {
            confirm = false
        }
    }, {
        key = "PageUp",
        mods = "SHIFT|CTRL",
        action = wezterm.action.ScrollByPage(-1)
    }, {
        key = "PageDown",
        mods = "SHIFT|CTRL",
        action = wezterm.action.ScrollByPage(1)
    }, {
        key = "UpArrow",
        mods = "SHIFT|CTRL",
        action = wezterm.action.ScrollByLine(-1)
    }, {
        key = "DownArrow",
        mods = "SHIFT|CTRL",
        action = wezterm.action.ScrollByLine(1)
    }}
}

return {
    keybindings = keybindings
}

