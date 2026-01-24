{ config, pkgs, lib, ... }:

let
  # Use Nixpkgs fonts directly (no Stylix)
  sans = "DejaVu Sans";

  # Base16 Catppuccin Mocha palette (RRGGBB)
  # Source: catppuccin-mocha base16 scheme
  c = {
    base00 = "1e1e2e"; # crust-ish
    base01 = "181825";
    base02 = "313244";
    base03 = "45475a";
    base04 = "585b70";
    base05 = "cdd6f4";
    base06 = "f5e0dc";
    base07 = "b4befe";
    base08 = "f38ba8";
    base09 = "fab387";
    base0A = "f9e2af";
    base0B = "a6e3a1";
    base0C = "94e2d5";
    base0D = "89b4fa";
    base0E = "cba6f7";
    base0F = "f2cdcd";
  };

  hex = v: "#${v}";
in
{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        margin-top = 13;

        modules-left = [ "custom/launcher" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "custom/notification" "pulseaudio" "battery" "network" "power-profiles-daemon" ];

        "custom/launcher" = {
          "format" = "󱄅";
          "tooltip" = false;
          "on-click" = "${pkgs.rofi}/bin/rofi -show drun";
        };

        "hyprland/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "urgent" = "";
            "active" = "";
            "visible" = "";
            "default" = "";
            "empty" = "";
          };
          "on-scroll-up" = "hyprctl dispatch split-cycleworkspaces -1";
          "on-scroll-down" = "hyprctl dispatch split-cycleworkspaces +1";
          "all-outputs" = false;
        };


        clock = {
          "format" = "{:%a %d-%m-%Y %H:%M:%S}";
          "tooltip" = true;
          "tooltip-format" = "<tt>{calendar}</tt>";
          "calendar" = {
            "mode" = "month";
            "on-scroll" = 1;
            "format" = {
              "months" = "<span color='#CDD6F4'><b>{}</b></span>";
              "days" = "<span color='#CDD6F4'><b>{}</b></span>";
              "weeks" = "<span color='#F9E2AF'><b>W{}</b></span>";
              "weekdays" = "<span color='#F9E2AF'><b>{}</b></span>";
              "today" = "<span color='#F38BA8'><b><u>{}</u></b></span>";
            };
          };
          "interval" = 1;
        };


        "custom/notification" = {
          tooltip = true;
          format = "<span size='16pt'>{icon}</span>";
          format-icons = {
            notification = "󱅫";
            none = "󰂜";
            dnd-notification = "󰂠";
            dnd-none = "󰪓";
            inhibited-notification = "󰂛";
            inhibited-none = "󰪑";
            dnd-inhibited-notification = "󰂛";
            dnd-inhibited-none = "󰪑";
          };
          return-type = "json";
          exec-if = "command -v swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            phone-muted = "";
            portable = "";
            car = "";
            default = [ "" "" ];
          };
          scroll-step = 1;
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          ignored-sinks = [ "Easy Effects Sink" ];
        };

        battery = {
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        network = {
          interface = "wlo1";
          format = "{ifname}";
          format-wifi = "{essid} ";
          format-ethernet = "{ipaddr}/{cidr} 󰊗";
          format-disconnected = "";
          tooltip-format = "{ifname} via {gwaddr} 󰊗";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
      }
    ];

    # CSS (fonts from Nixpkgs/Stylix, colors from Stylix)
    style = ''
      @import "colors.css";

      * {
        border: none;
        border-radius: 50px;
        font-family: "Maple Propo NF", "${sans}", "JetBrainsMono Nerd Font Propo", Roboto, Helvetica, Arial, sans-serif;
        font-weight: 600;
        font-size: 1rem;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
      }

      tooltip {
        background: @surface;
        border: 1px solid rgba(100, 114, 125, 0.5);
        border-radius: 10px;
      }

      #clock tooltip {
        border-radius: 10px;
      }

      tooltip label {
        color: white;
      }

      .modules-left {
        margin-left: 15px;
      }

      .modules-right {
        margin-right: 15px;
      }

      #custom-launcher,
      #clock,
      #workspaces,
      #custom-notification,
      #pulseaudio,
      #battery,
      #network,
      #power-profiles-daemon {
        background-color: @surface;
        color: @primary;
        margin-right: 10px;
        padding: 0 15px;
      }

      #power-profiles-daemon {
        margin: 0;
      }

      #workspaces {
        background-color: @surface;
        color: @primary;
        padding: 8px 5px;
        border-radius: 16px;
      }

      #workspaces button {
        background-color: @on_secondary;
        color: @tertiary;
        min-width: 20px;
        padding: 0px 6px;
        margin: 0px 3px;
        border-radius: 5px;
        transition: all 0.3s ease-in-out;
      }

      #workspaces button.active,
      #workspaces button.visible {
        background-color: @secondary;
        color: @surface;
        min-width: 20px;
        transition: all 0.3s ease-in-out;
        font-size: 13px;
        border-radius: 5px;
      }

      #workspaces button:hover {
        background-color: @tertiary;
        color: @surface;
        min-width: 20px;
        border-radius: 5px;
        background-size: 400% 400%;
      }

      #workspaces button.urgent {
        background-color: ${hex c.base08};
        color: ${hex c.base05};
        min-width: 20px;
        border-radius: 5px;
        background-size: 400% 400%;
        transition: all 0.3s ease-in-out;
      }
    '';
  };
}

