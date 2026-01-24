{pkgs, ...}:

{
  # set fish as default shell
  programs.fish.enable = true;
  users.users.ryujin.shell = pkgs.fish;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ryujin = {
    isNormalUser = true;
    description = "ryujin";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
}
