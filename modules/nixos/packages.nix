{pkgs, inputs, ...}:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    acpi
    bat
    brightnessctl
    btop
    curl
    eza
    fastfetch
    fzf
    galculator
    grim
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    nodejs
    protonup-ng
    ripgrep
    slurp
    swaylock
    tesseract
    wget
    wl-clipboard

    # fonts
    nerd-fonts.jetbrains-mono
  ];

  fonts.packages = with pkgs; [
    # Maple Mono (Ligature TTF unhinted)
    maple-mono.truetype
    # Maple Mono NF (Ligature unhinted)
    maple-mono.NF-unhinted
    # Maple Mono NF CN (Ligature unhinted)
    maple-mono.NF-CN-unhinted
  ];
}
