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
    ./theme.nix
  ];

  programs = {
    home-manager.enable = true;

    firefox.enable = true;

    bash = {
      enable = true;
      enableCompletion = true;
      bashrcExtra = ''
        export TERM=xterm-256color
      '';

      # shellAliases = {};
    };

    kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 9;
      };
      shellIntegration.enableBashIntegration = true;
      themeFile = "Catppuccin-Mocha";
    };
  };

  home.packages = with pkgs; [
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
    mako
    hyprsysteminfo
    hyprland-qt-support
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    pamixer
  ];
}
