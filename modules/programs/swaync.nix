{ config, pkgs, ... }:

{
  services.swaync = {
    enable = true;

    # ====== Config (adapté depuis ton config.json) ======
    settings = {
      # (optionnel) schema: pas nécessaire côté HM, swaync s’en fout
      # "$schema" = "$XDG_CONFIG_HOME/swaync/configSchema.json";

      "control-center-height" = 2;
      "control-center-layer" = "overlay";
      "control-center-margin-bottom" = 20;
      "control-center-margin-left" = 0;
      "control-center-margin-right" = 10;
      "control-center-margin-top" = 20;
      "control-center-width" = 500;

      "cssPriority" = "application";

      "control-center-positionX" = "right";
      "control-center-positionY" = "center";

      "fit-to-screen" = true;
      "hide-on-action" = false;
      "hide-on-clear" = false;

      "image-visibility" = "when-available";
      "keyboard-shortcuts" = true;

      # IMPORTANT: tu avais "layer": "layer" dans le JSON (valeur invalide).
      # Swaync attend "overlay" / "top" / "bottom" selon la version/config.
      # Mets "overlay" pour être cohérent.
      "layer" = "overlay";

      "notification-body-image-height" = 100;
      "notification-body-image-width" = 200;
      "notification-icon-size" = 40;
      "notification-inline-replies" = true;

      "notification-visibility" = { };
      "notification-window-width" = 400;

      "positionX" = "right";
      "positionY" = "top";

      "script-fail-notify" = true;
      "scripts" = { };

      "timeout" = 10;
      "timeout-critical" = 0;
      "timeout-low" = 5;
      "transition-time" = 100;

      "widget-config" = {
        "buttons-grid" = {
          "actions" = [
            {
              "active" = false;
              "command" = "notify-send 'hey'";
              "label" = "󰤄";
              "type" = "toggle";
              "update_command" = "notify-send 'Hi'";
            }
            {
              "active" = false;
              "command" = "swaync-client -d";
              "label" = "";
              "type" = "toggle";
            }
            {
              "active" = false;
              "command" = "obs";
              "label" = "󰄀";
              "type" = "button";
            }
            {
              "active" = false;
              "command" = "obs";
              "label" = "󰕧";
              "type" = "button";
            }
            {
              "active" = false;
              "command" = "swaync-client -t";
              "label" = "";
              "type" = "toggle";
            }
          ];
        };

        "mpris" = {
          "image-radius" = 12;
          "image-size" = 96;
        };

        "title" = {
          "text" = "Notifications";
          "button-text" = "󰎟  Clear";
          "clear-all-button" = true;
        };

        "volume" = {
          "label" = "";
          "show-per-app" = true;
          "show-per-app-icon" = true;
          "show-per-app-label" = true;
        };
      };

      "widgets" = [
        "title"
        "notifications"
        "buttons-grid"
        "mpris"
        "volume"
      ];
    };

    # ====== CSS (adapté depuis ton style.css) ======
    # - garde ton import matugen
    # - enlève -gtk-outline-radius (warnings)
    # - corrige le selector ".notification..notification-content"
    style = ''
    @import 'colors/colors.css';

    * {
      font-family: "Maple Mono NF", "Jetbrains Mono", monospace;
      font-size: 14px;
      transition: 150ms;
    }


    /* =========================
      FULLSCREEN BACKDROP
      ========================= */

    .control-center,
    .floating-notifications {
      background: transparent;
      background-color: transparent;
    }


    /* =========================
      MAIN PANEL
      ========================= */

    .control-center {
      margin: 7px;

      padding: 12px;

      border-radius: 18px;

      background-color: rgba(40, 40, 45, 0.92);

      border: 1px solid rgba(255,255,255,0.08);

      box-shadow: 0px 8px 30px rgba(0,0,0,0.35);
    }


    /* =========================
      TITLE
      ========================= */

    .widget-title {
      margin-bottom: 10px;
    }

    .widget-title label {
      color: @on_surface;
      font-size: 16px;
      font-weight: 600;
    }

    .widget-title button {
      background: transparent;
      color: @on_surface;

      border-radius: 12px;
      padding: 6px 12px;
    }

    .widget-title button:hover {
      background-color: rgba(255,255,255,0.1);
    }


    /* =========================
      NOTIFICATIONS
      ========================= */

    .notification-row {
      background: transparent;
    }


    .notification {
      background-color: rgba(60,60,65,0.95);

      border-radius: 14px;

      margin: 6px 0;

      padding: 10px;

      border: 1px solid rgba(255,255,255,0.05);
    }


    .notification-content {
      background: transparent;
    }


    .summary {
      color: @on_surface;

      font-weight: 600;
    }


    .body {
      color: rgba(220,220,220,0.75);
    }


    .time {
      color: rgba(220,220,220,0.55);
    }


    .notification image {
      margin-right: 10px;
    }


    .close-button {
      background: transparent;

      border-radius: 50%;

      color: @on_surface;
    }


    .close-button:hover {
      background-color: rgba(255,255,255,0.12);
    }



    /* =========================
      BUTTON GRID
      ========================= */

    .widget-buttons-grid {
      margin-top: 12px;
    }


    .widget-buttons-grid button {
      background-color: rgba(255,255,255,0.06);

      border-radius: 14px;

      padding: 12px;
    }


    .widget-buttons-grid button:hover {
      background-color: rgba(255,255,255,0.12);
    }


    .widget-buttons-grid button label {
      color: @on_surface;
      font-size: 18px;
    }


    .widget-buttons-grid button:checked {
      background-color: @primary;
    }


    .widget-buttons-grid button:checked label {
      color: @surface;
    }



    /* =========================
      MPRIS
      ========================= */

    .widget-mpris {
      margin-top: 12px;
    }


    .widget-mpris-player {
      background-color: rgba(255,255,255,0.05);

      border-radius: 14px;

      padding: 10px;
    }


    .widget-mpris-title {
      color: @on_surface;

      font-weight: 600;
    }


    .widget-mpris-subtitle {
      color: rgba(220,220,220,0.7);
    }



    /* =========================
      VOLUME
      ========================= */

    .widget-volume {
      margin-top: 12px;
    }


    .widget-volume trough {
      background-color: rgba(255,255,255,0.15);

      border-radius: 20px;
    }


    .widget-volume trough highlight {
      background-color: @primary;

      border-radius: 20px;
    }

  '';
  };
}

