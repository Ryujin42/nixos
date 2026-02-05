{ pkgs, ... }:

{
  networking = {
    hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
    
    firewall.enable = false;
    firewall.checkReversePath = false;

    # wireless.networks = {
    #   "Livebox-5920" = {
    #     psk="zWfHYSpvRCV6KEpjQw";
    #   };
    # };
  };
  
  environment.systemPackages = with pkgs; [wireguard-tools protonvpn-gui];
}
