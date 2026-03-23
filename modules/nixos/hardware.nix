{ pkgs, ... }:

{
  services.xserver.videoDrivers = ["amdgpu"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.amdgpu = {
    opencl.enable = true;
  };

  environment.systemPackages = with pkgs; [
    clinfo
    rocmPackages.rocminfo
    rocmPackages.rocm-smi
  ];

  services.hardware.openrgb = { 
    enable = true; 
    package = pkgs.openrgb-with-all-plugins; 
    motherboard = "intel"; 
    server = { 
      port = 6742; 
    }; 
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;  # critical for 32-bit games and Proton
  };
}