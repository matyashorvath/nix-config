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
    ./waybar.nix
    ./hyprpaper.nix
    ./rofi.nix
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

    kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 10;
      };
      shellIntegration.enableBashIntegration = true;
      themeFile = "Catppuccin-Mocha";
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
    vmware-workstation
    kitty-themes
    inputs.hyprpaper.packages.${system}.hyprpaper
    inputs.hyprpicker.packages.${system}.hyprpicker
    wl-clipboard
    wl-clip-persist
    cliphist
  ];
}
