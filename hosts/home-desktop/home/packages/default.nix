{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  programs = {
    home-manager.enable = true;

    firefox.enable = true;
  };

  home.packages = with pkgs; [
    vscode
    thunderbird
    inputs.alejandra.defaultPackage.${system}
    vmware-workstation
    chromium
    distrobox
    distrobox-tui
    inputs.winapps.packages."${system}".winapps
    ppsspp-sdl-wayland
    kdePackages.plasma-browser-integration
  ];
}