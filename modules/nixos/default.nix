{ ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./locale.nix
    ./users.nix
    ./packages.nix
    ./desktop.nix
    ./virtualization.nix
    ./audio.nix
    ./power.nix
    ./filesystems.nix
    ./hardware.nix
    ./steam.nix
  ];
}

