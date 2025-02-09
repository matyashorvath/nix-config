{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    configPath = ".config/rofi/config.rasi";
    font = "JetBrainsMono Nerd Font 9";
    location = "center";
    terminal = "${pkgs.kitty}/bin/kitty";

    theme = "arthur";

    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji
    ];
  };
}
