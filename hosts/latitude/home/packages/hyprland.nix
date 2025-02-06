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
    xwayland.enable = true;

    settings = {
      exec-once = [
        "systemctl --user start hyprpolkitagent"
        # Replace 'both' with 'regular' below if experiencing issues with text selection
        "wl-clip-persist --clipboard both"
        # Store text & images with cliphist
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "waybar"
        "hyprpaper"
      ];

      monitor = [
        "eDP-1, 1366x768@60, 0x0, 1"
        "HDMI-1, 1920x1080@120, 0x0, 1"
      ];

      "$terminal" = "kitty";

      input = {
        "kb_model" = "pc104";
        "kb_layout" = "hu";
        "kb_options" = "terminate:ctrl_alt_bksp";
        "numlock_by_default" = true;

        "sensitivity" = 0;
        "follow_mouse" = 1;
        "focus_on_close" = 1;

        touchpad = {
          "disable_while_typing" = true;
          "natural_scroll" = true;
          "scroll_factor" = 1.0;
          "tap-to-click" = true;
          "tap-and-drag" = true;
        };
      };

      gestures = {
        "workspace_swipe" = true;
      };

      "$mod" = "SUPER";
      bind = [
        "$mod, Q, exec, $terminal"
        "$mod, M, exit,"
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      ];
    };
  };
}
