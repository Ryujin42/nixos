{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/programs/apps.nix
    ../../modules/programs/fastfetch/fastfetch.nix
    ../../modules/programs/firefox.nix
    ../../modules/programs/fish.nix
    ../../modules/programs/git.nix
    ../../modules/programs/gtk.nix
    ../../modules/programs/kitty/kitty.nix
    ../../modules/programs/nvf-config.nix
    ../../modules/programs/rofi/rofi.nix
    ../../modules/programs/starship/starship.nix
    ../../modules/programs/obs.nix
    ../../modules/programs/swaync.nix
    ../../modules/programs/tmux.nix
    ../../modules/programs/waybar.nix
    ../../modules/programs/yazi.nix
    ../../modules/programs/zoxide.nix

    ../../modules/programs/hyprland/hyprland.nix
    ../../modules/programs/hyprland/hyprmodules.nix

    ../../modules/programs/scripts/waybar-launch.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ryujin";
  home.homeDirectory = "/home/ryujin";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ryujin/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_DATA_DIRS =
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:"
    + "${pkgs.glib}/share/gsettings-schemas/${pkgs.glib.name}:"
    + "$XDG_DATA_DIRS";

    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
