{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withRuby = true;
    withPython3 = true;
  };

  home.packages = with pkgs; [
    git
    ripgrep
    fd
    gcc
    nodejs
    tree-sitter
    lua-language-server
    nil
    pyright
    xclip
  ];
}