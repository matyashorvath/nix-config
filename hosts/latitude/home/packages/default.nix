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
    ./hyprland.nix
  ];

  programs = {
    home-manager.enable = true;

    firefox.enable = true;

    bash = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        PATH="$PATH:$HOME/Scripts"
      '';

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
    kitty
  ];
}
