local wezterm = require("wezterm")  -- Import the wezterm module for configuration.
local dracula = require('dracula')  -- Import the Dracula color scheme module.

local config = {

    -- Set the initial size of the terminal window.
    initial_cols = 150,  -- Initial number of columns.
    initial_rows = 30,   -- Initial number of rows.

    check_for_updates = true,  -- Enable automatic updates check for wezterm.

    -- Color schemes. Uncomment one to set it as the current color scheme.
    -- color_scheme = "Fahrenheit",
    -- color_scheme = "Gruvbox Dark",
    -- color_scheme = "Blue Matrix",
    -- color_scheme = "Pandora",
    -- color_scheme = "Grape",
    -- color_scheme = "Firewatch",
    -- color_scheme = "Duotone Dark",
    -- color_scheme = "Sakura",
    -- color_scheme = "lovelace",

    enable_scroll_bar = true,  -- Enable the scroll bar in the terminal window.
    exit_behavior = "Close",  -- Define what happens when the terminal exits; here it closes the window.

    inactive_pane_hsb = {
        hue = 1.0,  -- Set the hue of inactive panes.
        saturation = 1.0,  -- Set the saturation of inactive panes.
        brightness = 1.0,  -- Set the brightness of inactive panes.
    },

    -- font = wezterm.font(''),  -- Specify the font to use (commented out).
    -- font = wezterm.font_with_fallback({"CaskaydiaCove Nerd Font", "Cascadia Code", "Fira Code"}),  -- Specify fallback fonts (commented out).
    font_size = 11.5,  -- Set the font size.

    default_prog = {'pwsh.exe', '-NoLogo'},  -- Set the default program to run on startup; here, it's PowerShell.
    launch_menu = {},  -- Initialize the launch menu (will be populated later).

    -- Uncomment to use a leader key for triggering specific actions.
    -- leader = { key = "b", mods = "CTRL" },

    set_environment_variables = {},  -- Set environment variables for the terminal (currently empty).

    colors = dracula,  -- Set the color scheme to Dracula theme.
    tab_bar_at_bottom = false,  -- Place the tab bar at the bottom of the terminal window.
    use_fancy_tab_bar = false,  -- Disable the fancy tab bar (use a simpler one).

    -- Set window decorations; only include integrated buttons and resize options.
    -- window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    window_decorations = "RESIZE",

    -- Uncomment to normalize newlines when pasting text.
    -- canonicalize_pasted_newlines = true,

    mouse_bindings = {
        {
            event = {
                Up = {
                    streak = 1,
                    button = "Left"
                }
            },
            mods = "NONE",
            action = wezterm.action.CompleteSelection("PrimarySelection")
        },  -- Left-click to complete selection.
        {
            event = {
                Up = {
                    streak = 1,
                    button = "Left"
                }
            },
            mods = "CTRL",
            action = wezterm.action.OpenLinkAtMouseCursor
        },  -- CTRL-Click to open hyperlinks under the mouse cursor.
        {
            event = {
                Down = {
                    streak = 1,
                    button = 'Left'
                }
            },
            mods = 'CTRL',
            action = wezterm.action.Nop
        }  -- Disable CTRL-Click 'Down' event to avoid unwanted behaviors.
    },

    disable_default_key_bindings = true,  -- Disable all default key bindings to allow custom bindings only.

    keys = {
        {
            key = "_",
            mods = "SHIFT|ALT",
            action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" })
        }, -- Split Vertially with ALT+SHIFT+-.
        {
            key = "+",
            mods = "SHIFT|ALT",
            action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })
        }, -- Split Horizantally with ALT+SHIFT+=.
        {
            key = 'Tab',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.ActivateTabRelative(1)
        },  -- Switch to the next tab with SHIFT+CTRL+Tab.
        {
            key = 'F11',
            mods = 'NONE',
            action = wezterm.action.ToggleFullScreen
        },  -- Toggle full-screen mode with F11.
        {
            key = '+',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.IncreaseFontSize
        },  -- Increase font size with SHIFT+CTRL+Plus.
        {
            key = '-',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.DecreaseFontSize
        },  -- Decrease font size with SHIFT+CTRL+Minus.
        {
            key = 'C',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.CopyTo 'Clipboard'
        },  -- Copy selected text to clipboard with SHIFT+CTRL+C.
        {
            key = 'N',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.SpawnWindow
        },  -- Open a new terminal window with SHIFT+CTRL+N.
        {
            key = 'T',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.ShowLauncher
        },  -- Open a new tab with SHIFT+CTRL+T.
        {
            key = 'Enter',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.ShowLauncherArgs {flags = 'FUZZY|TABS|LAUNCH_MENU_ITEMS'}
        },  -- Open the launcher menu with SHIFT+CTRL+Enter.
        {
            key = 'V',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.PasteFrom 'Clipboard'
        },  -- Paste clipboard content with SHIFT+CTRL+V.
        {
            key = 'W',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.CloseCurrentTab{confirm = false}
        },  -- Close the current tab without confirmation with SHIFT+CTRL+W.
        {
            key = 'PageUp',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.ScrollByPage(-1)
        },  -- Scroll up one page with SHIFT+CTRL+PageUp.
        {
            key = 'PageDown',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.ScrollByPage(1)
        },  -- Scroll down one page with SHIFT+CTRL+PageDown.
        {
            key = 'UpArrow',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.ScrollByLine(-1)
        },  -- Scroll up one line with SHIFT+CTRL+UpArrow.
        {
            key = 'DownArrow',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.ScrollByLine(1)
        },  -- Scroll down one line with SHIFT+CTRL+DownArrow.
    },
}

-- Configure the launch menu based on the operating system.
if wezterm.target_triple == "x86_64-pc-windows-msvc" then

    table.insert(config.launch_menu, {
        label = "PowerShell",
        args = {"C:\\Program Files\\PowerShell\\7\\pwsh.exe"}
    })

    table.insert(config.launch_menu, {
        label = "Command Prompt",
        args = {"cmd.exe"}
    })

    table.insert(config.launch_menu, {
        label = "PowerShell 7",
        args = {"pwsh.exe", "-NoLogo"}
    })

    table.insert(config.launch_menu, {
        label = "Git Bash",
        args = {"C:\\Program Files\\Git\\bin\\bash.exe"}
    })

else
    -- Not a Windows environment
    table.insert(config.launch_menu, {
        label = "fish",
        args = {"fish", "-l"} -- "-l" for login shell 
    })

    table.insert(config.launch_menu, {
        label = "zsh",
        args = {"zsh", "-l"}
    })

end

-- Function to get the base name of a file path for display on the tab bar.
function Basename(s)
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

-- Format the tab title to show the base name of the foreground process.
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = Basename(pane.foreground_process_name)
    return {{
        Text = " " .. title .. " "
    }}
end)

return config
