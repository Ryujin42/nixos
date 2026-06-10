{ config, pkgs, inputs, ... }:

{
wayland.windowManager.hyprland = {
enable = true;

package =
  inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

configType = "lua";

plugins = [
  inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
];

};

xdg.configFile."hypr/hyprland.lua" = {
force = true;
text = builtins.readFile ./hyprland.lua;
};

xdg.configFile."hypr/hyprlock.conf" = {
force = true;
text = ''
source = ~/.config/hypr/colors.conf

  general {
      grace = 0
  }

  background {
      monitor =
      path = $image
      blur_passes = 3
  }

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
'';

};
}
