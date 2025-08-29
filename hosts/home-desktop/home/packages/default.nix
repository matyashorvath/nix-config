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

    bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        wg-r = "sudo systemctl restart wireguard-wg0.service";
      };
    };
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
    kdePackages.plasma-browser-integration
  ];
}
