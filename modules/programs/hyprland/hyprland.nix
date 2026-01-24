{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    settings = {
      general = {}; # to avoid warning
    };

    plugins = [
      inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
    ];
  };

  # ===== Hyprland main file =====
  xdg.configFile."hypr/hyprland.conf" = {
    force = true;
    text = ''
      # ~/.config/hypr/hyprland.conf
      
      source = ~/.config/hypr/colors.conf
      source = ~/.config/hypr/variables.conf

      source = ~/.config/hypr/hyprland/env.conf
      source = ~/.config/hypr/hyprland/monitors.conf
      source = ~/.config/hypr/hyprland/general.conf
      source = ~/.config/hypr/hyprland/decoration.conf
      source = ~/.config/hypr/hyprland/animation.conf
      source = ~/.config/hypr/hyprland/input.conf
      source = ~/.config/hypr/hyprland/group.conf
      source = ~/.config/hypr/hyprland/misc.conf
      source = ~/.config/hypr/hyprland/rules.conf
      source = ~/.config/hypr/hyprland/execs.conf
      source = ~/.config/hypr/hyprland/keybinds.conf
    '';
  };

  # ===== Variables (Stylix colors injected here) =====
  xdg.configFile."hypr/variables.conf" = {
    force = true;
    text = ''
      # ~/.config/hypr/variables.conf
      plugin:split-monitor-workspaces:count = 5

      # Apps
      $terminal = kitty
      $browser  = brave
      $fileManager = nemo
      $menu = rofi -show drun

      # Colors / sizes (Stylix)
      $active_border   = $primary
      $inactive_border = $on_secondary
      $rounding = 20
      $gap_in  = 7
      $gap_out = 15, 15, 15, 15
      $border  = 2
    '';
  };

  # ===== Hyprland split files =====
  xdg.configFile."hypr/hyprland/animation.conf" = {
    force = true;
    text = ''
      animations {
        enabled = true
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
      }
    '';
  };

  xdg.configFile."hypr/hyprland/general.conf" = {
    force = true;
    text = ''
      general {
        gaps_in = $gap_in
        gaps_out = $gap_out
        border_size = $border
        col.active_border = $active_border
        col.inactive_border = $inactive_border
        resize_on_border = false
        allow_tearing = false
        layout = dwindle
      }
    '';
  };

  xdg.configFile."hypr/hyprland/rules.conf" = {
    force = true;
    text = ''
      # Window / workspace rules
      # windowrule = float, ^(kitty)$
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # windowrulev2 = suppressevent maximize, class:.*
    '';
  };

  xdg.configFile."hypr/hyprland/env.conf" = {
    force = true;
    text = ''
      # Environment
      env = XCURSOR_SIZE,24
      env = HYPRCURSOR_SIZE,24
    '';
  };

  xdg.configFile."hypr/hyprland/monitors.conf" = {
    force = true;
    text = ''
      # Monitors
      monitor = DP-3, 2560x1440@60Hz, 0x0, 1
      monitor = DP-1, 2560x1440@180Hz, 2560x0, 1
      monitor = DP-2, 2560x1440@60Hz, 5120x0, 1
    '';
  };

  xdg.configFile."hypr/hyprland/decoration.conf" = {
    force = true;
    text = ''
      decoration {
        rounding = $rounding
        active_opacity = 1.0
        inactive_opacity = 0.8

        blur {
          enabled = true
          size = 15
          passes = 2
          vibrancy = 0.5
          vibrancy_darkness = 0.2
        }

        shadow {
          enabled = true
          range = 13
          render_power = 3
          color = rgba(1e1e2eee)
        }
      }
    '';
  };

  xdg.configFile."hypr/hyprland/group.conf" = {
    force = true;
    text = ''
      dwindle {
        pseudotile = true
        preserve_split = true
      }
      master {
        new_status = master
      }
    '';
  };

  xdg.configFile."hypr/hyprland/misc.conf" = {
    force = true;
    text = ''
      misc {
        force_default_wallpaper = 0
        disable_hyprland_logo = false
      }
    '';
  };

  # Your original autostart (swww + waybar)
  xdg.configFile."hypr/hyprland/execs.conf" = {
    force = true;
    text = ''
      # Autostart
      exec-once = swww-daemon &
      exec-once = waybar &
    '';
  };

  xdg.configFile."hypr/hyprland/input.conf" = {
    force = true;
    text = ''
      input {
        kb_layout = fr
        kb_variant = latin9
        kb_model =
        kb_options =
        kb_rules =
        follow_mouse = 1
        sensitivity = 0
      }

      gestures {
      #  workspace_swipe = false
      }

      # Example per-device
      # device {
      #   name = epic-mouse-v1
      #   sensitivity = -0.5
      # }
    '';
  };

  xdg.configFile."hypr/hyprland/keybinds.conf" = {
    force = true;
    text = ''
      # Mod
      $mainMod = SUPER

      # Apps
      bind = $mainMod, Return, exec, $terminal
      bind = $mainMod, E, exec, $fileManager
      bind = $mainMod, R, exec, $menu
      bind = $mainMod, L, exec, hyprlock
      bind = $mainMod CTRL, R, exec, waybar-launch

      # Manage
      bind = $mainMod, C, killactive
      bind = $mainMod shift, E, exit
      bind = $mainMod, V, togglefloating
      bind = $mainMod, F, fullscreen
      bind = $mainMod, M, fullscreen, 1
      bind = $mainMod, J, togglesplit

      # Focus
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Swap
      bind = $mainMod CTRL, left, swapwindow, l
      bind = $mainMod CTRL, right, swapwindow, r
      bind = $mainMod CTRL, up, swapwindow, u
      bind = $mainMod CTRL, down, swapwindow, d

      # Workspaces
      bind = $mainMod, ampersand, split-workspace, 1
      bind = $mainMod, eacute, split-workspace, 2
      bind = $mainMod, quotedbl, split-workspace, 3
      bind = $mainMod, apostrophe, split-workspace, 4
      bind = $mainMod, parenleft, split-workspace, 5
      bind = $mainMod, minus, split-workspace, 6
      bind = $mainMod, egrave, split-workspace, 7
      bind = $mainMod, underscore, split-workspace, 8
      bind = $mainMod, ccedilla, split-workspace, 9
      bind = $mainMod, agrave, split-workspace, 10

      # Move window to workspace
      bind = $mainMod SHIFT, ampersand, split-movetoworkspace, 1
      bind = $mainMod SHIFT, eacute, split-movetoworkspace, 2
      bind = $mainMod SHIFT, quotedbl, split-movetoworkspace, 3
      bind = $mainMod SHIFT, apostrophe, split-movetoworkspace, 4
      bind = $mainMod SHIFT, parenleft, split-movetoworkspace, 5
      bind = $mainMod SHIFT, minus, split-movetoworkspace, 6
      bind = $mainMod SHIFT, egrave, split-movetoworkspace, 7
      bind = $mainMod SHIFT, underscore, split-movetoworkspace, 8
      bind = $mainMod SHIFT, ccedilla, split-movetoworkspace, 9
      bind = $mainMod SHIFT, agrave, split-movetoworkspace, 10

      # Move window to another screen
      bind = $mainMod SHIFT, right, split-changemonitor, +1
      bind = $mainMod SHIFT, left, split-changemonitor, -1

      # Special workspace
      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, split-movetoworkspace, special:magic

      # Scroll through existing workspaces
      bind = $mainMod, mouse_down, split-workspace, e+1
      bind = $mainMod, mouse_up, split-workspace, e-1

      # Move/resize windows with mouse
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      # Sound
      bind = ,XF86AudioRaiseVolume, exec, pamixer -i 5
      bind = ,XF86AudioLowerVolume, exec, pamixer -d 5
      bind = ,XF86AudioMute, exec, pamixer -t

      # Brightness
      bind = ,XF86MonBrightnessUp, exec, brightnessctl set 10%+
      bind = ,XF86MonBrightnessDown, exec, brightnessctl set 10%-

      # Player
      bind = ,XF86AudioPlay, exec, playerctl play-pause
      bind = ,XF86AudioNext, exec, playerctl next
      bind = ,XF86AudioPrev, exec, playerctl previous

      # screenshot
      bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
      bind = CTRL, Print, exec, grim - | wl-copy
      bind = ALT, Print, exec, grim -t focused - | wl-copy
      bind = $mainMod CTRL, T, exec, ./screenshot-ocr.sh

      # Theme
      bind = $mainMod, T, exec, theme-switcher

      # Dashboard
      bind = $mainMod, D, global, quickshell:dashboard_toggle
    '';
  };

  # ===== Hyprlock (Stylix wallpaper + colors) =====
  xdg.configFile."hypr/hyprlock.conf" = {
    force = true;
    text = ''
      source = ~/.config/hypr/colors.conf

      # WALLPAPER

      general {
          grace = 0
      }

      # BACKGROUND
      background {
          monitor =
          path = $image # screenshot
          blur_passes = 3 # 0 disables blurring
      }

      # PASSWORD-BOX
      input-field {
          monitor =
          size = 250, 50
          outline_thickness = 3
          dots_size = 0.26
          dots_spacing = 0.15
          dots_center = true
          dots_rounding = -1
          outer_color = $primary
          inner_color = rgba(1e1e2e29)
          font_color = rgb(cdd6f4)
          fade_on_empty = true
          placeholder_text =
          hide_input = false
          rounding = -1
          check_color = rgb(f9e2af)
          fail_color = rgb(f38ba8)
          fail_text =
          fail_transition = 300
          position = 0, 75
          halign = center
          valign = bottom
      }

      # NOW TIME
      label {
          monitor =
          text = cmd[update:1000] echo $(date +"%H:%M:%S")
          color = $primary
          font_size = 70
          font_family = CaskaydiaMono Nerd Font Bold
          position = 0, 70
          halign = center
          valign = center
      }

      # DATE
      label {
          monitor =
          text = cmd[update:1000] echo $(date +"%A, %d %B %Y")
          color = rgb(cdd6f4)
          font_size = 24
          font_family = CaskaydiaMono Nerd Font Bold
          position = 0, 0
          halign = center
          valign = center
      }

      # LOCK LOGO
      label {
          monitor =
          text = 
          color = rgb(cdd6f4)
          font_size = 18
          font_family = JetBrainsMono Nerd Font Propo
          position = 0, 30
          halign = center
          valign = bottom
      }

      # vim: set ft=hyprlang :
    '';
  };
}

