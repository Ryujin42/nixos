{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";

    hyprland.url = "github:hyprwm/Hyprland";
    # split-monitor-workspaces = {
    #   url = "github:zjeffer/split-monitor-workspaces";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # hypr-dynamic-cursors = {
    #   url = "github:VirtCode/hypr-dynamic-cursors";
    #   inputs.hyprland.follows = "hyprland";
    # };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # stylix.url = "github:danth/stylix";
  };

  outputs = inputs@{ 
    self,
    nixpkgs,
    home-manager,
    # split-monitor-workspaces,
    nvf,
    firefox-addons,
    ... 
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};  
  in {
    nixosConfigurations = {
      hostname = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs self; };

        modules = [
          # stylix.nixosModules.stylix
          ./hosts/default/configuration.nix
          
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {inherit inputs;};

              users.ryujin = {
                # wayland.windowManager.hyprland = {
                #   # ...
                #   plugins = [
                #     split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
                #   ];
                #   # ...
                # };

                imports = [
                  nvf.homeManagerModules.default
                  ./hosts/default/home.nix
                ];
              };
            };
          }
        ];
      };
    };
  };
}

