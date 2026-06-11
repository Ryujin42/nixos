-- ==========================================
-- Programs
-- ==========================================

local terminal    = "kitty"
local browser     = "brave"
local fileManager = "nemo"
local menu        = "rofi -show drun"

local mainMod = "SUPER"

-- ==========================================
-- split-monitor-workspaces
-- ==========================================

package.path = package.path .. ";./plugins/split-monitor-workspaces/lua/?.lua"

local smw = require("split-monitor-workspaces")

smw.setup({
    workspace_count = 10,
})

-- ==========================================
-- Monitors
-- ==========================================

hl.monitor({
    output = "DP-3",
    mode = "2560x1440@60",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "DP-1",
    mode = "2560x1440@180",
    position = "2560x0",
    scale = 1,
})

hl.monitor({
    output = "DP-2",
    mode = "2560x1440@60",
    position = "5120x0",
    scale = 1,
})

-- ==========================================
-- Environment
-- ==========================================

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- ==========================================
-- General
-- ==========================================

hl.config({
    general = {
        gaps_in = 7,
        gaps_out = { 15, 15, 15, 15 },

        border_size = 2,

        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",

        -- Replace with Stylix values if exported
        col = {
            active_border = "rgba(89b4faff)",
            inactive_border = "rgba(6c7086ff)",
        },
    },

    decoration = {
        rounding = 20,

        active_opacity = 1.0,
        inactive_opacity = 0.8,

        blur = {
            enabled = true,
            size = 15,
            passes = 2,
            vibrancy = 0.5,
            vibrancy_darkness = 0.2,
        },

        shadow = {
            enabled = true,
            range = 13,
            render_power = 3,
            color = 0xee1e1e2e,
        },
    },

    animations = {
        enabled = true,
    },

    input = {
        kb_layout = "fr",
        kb_variant = "latin9",

        follow_mouse = 1,
        sensitivity = 0,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = false,
    },
})

-- ==========================================
-- Animations
-- ==========================================

hl.curve("myBezier", {
    type = "bezier",
    points = {
        {0.05, 0.9},
        {0.1, 1.05},
    },
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "myBezier",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 7,
    bezier = "default",
    style = "popin 80%",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "default",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "default",
})

-- ==========================================
-- Autostart
-- ==========================================

hl.on("hyprland.start", function()
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar")
end)

-- ==========================================
-- Window Rules
-- ==========================================

hl.window_rule({
    name = "steam-main",

    match = {
        class = "steam",
        title = "^Steam$",
    },

    tile = true,
})

hl.window_rule({
    name = "steam-popup",

    match = {
        class = "steam",
        title = "^(?!Steam$)(.*)$",
    },

    float = true,
    center = true,
})

hl.window_rule({
    name = "galculator",

    match = {
        class = "galculator",
    },

    float = true,
})

hl.window_rule({
    name = "suppress-maximize",

    match = {
        class = ".*",
    },

    suppress_event = "maximize",
})

-- ==========================================
-- Applications
-- ==========================================

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("waybar-launch"))

-- ==========================================
-- Window Management
-- ==========================================

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())

hl.bind(
    mainMod .. " + V",
    hl.dsp.window.float({ action = "toggle" })
)

hl.bind(
    mainMod .. " + F",
    hl.dsp.exec_cmd("hyprctl dispatch fullscreen")
)

hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd("hyprctl dispatch fullscreen 1")
)

hl.bind(
    mainMod .. " + J",
    hl.dsp.layout("togglesplit")
)

-- ==========================================
-- Focus
-- ==========================================

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- ==========================================
-- Swap Windows
-- ==========================================

hl.bind(mainMod .. " + CTRL + left",
    hl.dsp.exec_cmd("hyprctl dispatch swapwindow l"))

hl.bind(mainMod .. " + CTRL + right",
    hl.dsp.exec_cmd("hyprctl dispatch swapwindow r"))

hl.bind(mainMod .. " + CTRL + up",
    hl.dsp.exec_cmd("hyprctl dispatch swapwindow u"))

hl.bind(mainMod .. " + CTRL + down",
    hl.dsp.exec_cmd("hyprctl dispatch swapwindow d"))

-- ==========================================
-- Workspaces (split-monitor-workspaces)
-- ==========================================

local workspaceKeys = {
    "ampersand",
    "eacute",
    "quotedbl",
    "apostrophe",
    "parenleft",
    "minus",
    "egrave",
    "underscore",
    "ccedilla",
    "agrave",
}

for i = 1, 10 do
    hl.bind(
        mainMod .. " + " .. workspaceKeys[i],
        smw.workspace(tostring(i))
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. workspaceKeys[i],
        smw.move_to_workspace_silent(tostring(i))
    )
end

hl.bind(
    mainMod .. " + mouse_down",
    smw.cycle_workspaces("next")
)

hl.bind(
    mainMod .. " + mouse_up",
    smw.cycle_workspaces("prev")
)

-- ==========================================
-- Special Workspace
-- ==========================================

hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special:magic"
    })
)

-- ==========================================
-- Mouse
-- ==========================================

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

-- ==========================================
-- Audio
-- ==========================================

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("pamixer -i 5"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("pamixer -d 5"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("pamixer -t"),
    { locked = true }
)

-- ==========================================
-- Brightness
-- ==========================================

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set 10%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 10%-"),
    { locked = true, repeating = true }
)

-- ==========================================
-- Media
-- ==========================================

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)

-- ==========================================
-- Screenshots
-- ==========================================

hl.bind(
    "Print",
    hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy]])
)

hl.bind(
    "CTRL + Print",
    hl.dsp.exec_cmd([[grim -g "$(hyprctl monitors -j | jq -r '.[] | select(.focused) | "\(.x),\(.y) \(.width)x\(.height)"')" - | wl-copy]])
)

hl.bind(
    "ALT + Print",
    hl.dsp.exec_cmd([[grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" - | wl-copy]])
)

hl.bind(
    mainMod .. " + CTRL + T",
    hl.dsp.exec_cmd("./screenshot-ocr.sh")
)

-- ==========================================
-- Theme
-- ==========================================

hl.bind(
    mainMod .. " + T",
    hl.dsp.exec_cmd("theme-switcher")
)

-- ==========================================
-- Dashboard
-- ==========================================

hl.bind(
    mainMod .. " + D",
    hl.dsp.exec_cmd("hyprctl dispatch global quickshell:dashboard_toggle")
)