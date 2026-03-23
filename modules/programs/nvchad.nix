{ config, pkgs, ... }:

let
  nvchad = builtins.fetchGit {
    url = "https://github.com/NvChad/NvChad";
    rev = "v2.5"; # pin this
  };
in
{
  home.file.".config/nvim".source = nvchad;

  # Your custom config layer
  home.file.".config/nvim/lua/custom".source = ./nvim-custom;
}