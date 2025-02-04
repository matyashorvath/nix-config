{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
  ];

  programs = {
    home-manager.enable = true;

    firefox.enable = true;

    bash = {
      enable = true;
      enableCompletion = true;

      # shellAliases = {};
    };
  };

  home.packages = with pkgs; [
    gnome-tweaks
    vscode
    fastfetch
    thunderbird
    gparted
    inputs.alejandra.defaultPackage.${system}
    git-credential-oauth
  ];
}
