{ pkgs, ... }:

{
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  
  networking.firewall.enable = false;
  networking.firewall.checkReversePath = false;
  environment.systemPackages = with pkgs; [wireguard-tools protonvpn-gui];


  # networking.wireless.networks = {
  #   "Livebox-5920" = {
  #     psk = "zWfHYSpvRCV6KEpjQw";
  #   };
  # };

  # networking.useDHCP = true;
}
