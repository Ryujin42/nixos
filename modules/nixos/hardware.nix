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
}