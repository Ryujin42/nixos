{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
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