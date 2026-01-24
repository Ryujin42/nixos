{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    configPath = "./config.rasi";
    theme = "./theme.rasi";
  };

  home.file.".config/rofi/config.rasi" = {
    source = ./config.rasi;
  };
  home.file.".config/rofi/theme.rasi" = {
    source = ./theme.rasi;
  };
}
