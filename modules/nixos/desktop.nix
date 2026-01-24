{ inputs, pkgs, ... }:

{
  programs.niri.enable = true;
  programs.hyprland.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  hardware.bluetooth.enable = true;
}
