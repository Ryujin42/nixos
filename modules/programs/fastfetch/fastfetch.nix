{ pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;

    # boldFont = "FiraCode Nerd Font Mono Bold";
    # italicFont = "Hasklug Nerd Font Mono Italic";

    # adjustLineHeight = 3;
    # windowPaddingWidth = 5.0;
    # backgroundOpacity = 1;
    
    extraConfig = ''
      include config.jsonc
    '';

  };

  home.file.".config/fastfetch/config.jsonc" = {
    source = ./config.jsonc;
  };

  home.file.".config/fastfetch/kirby.jpeg" = {
    source = ./kirby.jpeg;
  };
}
}

