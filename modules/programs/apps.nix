{pkgs, ...}:

{
  # The home.packages option allows you to install Nix packages into your
  # environment.

  home.packages = with pkgs; [
    android-tools
    awww
    brave
    catppuccin-cursors
    discord
    docker
    filezilla
    glib
    godot
    gsettings-desktop-schemas
    heroic
    quickshell
    lazygit
    libnotify
    liquidctl
    lmstudio
    matugen
    melonds
    musescore
    muse-sounds-manager
    nemo-with-extensions
    nerd-fonts.jetbrains-mono
    nwg-look
    pcsx2
    pinta
    prismlauncher
    pywalfox-native
    qbittorrent
    retroarch-full
    scrcpy
    shotcut
    solaar
    telegram-desktop
    vesktop
    vlc
    virtualbox
    vscodium
    xdotool

    android-file-transfer
    jmtpfs
  ];


}
