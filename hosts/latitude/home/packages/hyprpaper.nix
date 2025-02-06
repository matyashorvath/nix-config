{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;

      preload = ["~/Pictures/39.jpg"];
      wallpaper = [",~/Pictures/39.jpg"];
    };
  };
}
