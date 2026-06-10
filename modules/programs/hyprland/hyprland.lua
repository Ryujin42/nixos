local mod = "SUPER"

return {
    env = {
        XCURSOR_SIZE = 24,
        HYPRCURSOR_SIZE = 24,
    },

    monitor = {
        "DP-3,2560x1440@60Hz,0x0,1",
        "DP-1,2560x1440@180Hz,2560x0,1",
        "DP-2,2560x1440@60Hz,5120x0,1",
    },

    general = {
        gaps_in = 7,
        gaps_out = { 15, 15, 15, 15 },

        border_size = 2,

        col = {
            active_border = "$primary",
            inactive_border = "$on_secondary",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
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
            color = "rgba(1e1e2eee)",
        },
    },

    animations = {
        enabled = true,

        bezier = {
            "myBezier,0.05,0.9,0.1,1.05",
        },

        animation = {
            "windows,1,7,myBezier",
            "windowsOut,1,7,default,popin 80%",
            "border,1,10,default",
            "borderangle,1,8,default",
            "fade,1,7,default",
            "workspaces,1,6,default",
        },
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

    exec_once = {
        "swww-daemon",
        "waybar",
    },

    bind = {
        mod .. ", Return, exec, kitty",
        mod .. ", E, exec, nemo",
        mod .. ", R, exec, rofi -show drun",
        mod .. ", L, exec, hyprlock",

        mod .. ", C, killactive",
        mod .. ", V, togglefloating",
        mod .. ", F, fullscreen",
        mod .. ", M, fullscreen, 1",

        mod .. ", left, movefocus, l",
        mod .. ", right, movefocus, r",
        mod .. ", up, movefocus, u",
        mod .. ", down, movefocus, d",

        ",XF86AudioRaiseVolume,exec,pamixer -i 5",
        ",XF86AudioLowerVolume,exec,pamixer -d 5",
        ",XF86AudioMute,exec,pamixer -t",
    },

    bindm = {
        mod .. ",mouse:272,movewindow",
        mod .. ",mouse:273,resizewindow",
    },

    windowrule = {
        "tile on, match:class steam, match:title ^Steam$",
        "float on, match:class steam, match:title ^(?!Steam$)(.*)$",
        "center on, match:class steam, match:title ^(?!Steam$)(.*)$",
        "float on, match:class galculator",
    },

    windowrulev2 = {
        {
            name = "no_maximize",
            class = ".*",
            suppress_event = "maximize",
        },
    },
}