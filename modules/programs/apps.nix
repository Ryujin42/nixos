{pkgs, ...}:

{
  # The home.packages option allows you to install Nix packages into your
  # environment.

  home.packages = with pkgs; [
    android-tools
    brave
    catppuccin-cursors
    discord
    docker
    filezilla
    glib
    gsettings-desktop-schemas
    heroic
    quickshell
    lazygit
    libnotify
    lmstudio
    matugen
    melonDS
    musescore
    muse-sounds-manager
    nemo-with-extensions
    nerd-fonts.jetbrains-mono
    nwg-look
    pinta
    prismlauncher
    pywalfox-native
    qbittorrent
    retroarch-full
    scrcpy
    solaar
    vesktop
    vlc
    swww
    virtualbox
    vscodium
  ];


}
