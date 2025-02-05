{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    extraCommands = [
      "systemctl --user start hyprpolkitagent"
    ];
  };
}
