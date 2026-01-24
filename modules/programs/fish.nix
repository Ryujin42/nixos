{ pkgs, ... }:

let
  aliasSet = {
    ll = "eza -l --icons";
    l = "ll -a";
    tree = "eza --icons --tree";
    vim = "nvim";
    ff = "fastfetch";
    lg = "lazygit";
    v = "nvim";
    t = "tmux";
    z = "zoxide";
    cd = "z";
    nrs = "sudo nixos-rebuild switch --flake ~/nixos#hostname";
  };

in {
  programs.fish = {
    enable = true;
    shellAliases = aliasSet;
    shellInit = ''
        function fish_greeting; fastfetch; end;
        function mkcd; mkdir $argv[1] -p; if test -d "$argv[1]"; cd $argv[1]; end; end; 
      '';
    plugins = [
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
    ];
  };
}
