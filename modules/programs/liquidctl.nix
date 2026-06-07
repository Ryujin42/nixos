{...}:

{
  services.udev.extraRules = ''
  # NZXT Kraken Plus V2
  SUBSYSTEM=="usb", ATTR{idVendor}=="1e71", ATTR{idProduct}=="3014", MODE="0666", GROUP="plugdev"
  SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="3014", MODE="0666", GROUP="plugdev"

  # NZXT Control Hub
  SUBSYSTEM=="usb", ATTR{idVendor}=="1e71", ATTR{idProduct}=="2022", MODE="0666", GROUP="plugdev"
  SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2022", MODE="0666", GROUP="plugdev"
'';
}