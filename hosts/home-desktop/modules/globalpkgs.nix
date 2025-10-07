{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "dotnet-sdk-6.0.428"
      "dotnet-runtime-6.0.36"
    ];
  };

  programs = {
    kdeconnect.enable = true;
    steam.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    fastfetch
    gparted
    git-crypt
    wine-wayland
    gnumake
    gdb
    python3
    wineWowPackages.waylandFull
    nsnake
    htop
    openra
    nix-search-cli
  ];
}
