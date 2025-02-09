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
        "wl-clip-persist --clipboard regular"

        # Store text & images with cliphist
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "waybar & hyprpaper"
      ];

      env = [
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "NIXOS_OZONE_WL,1"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
      ];

      monitor = [
        "eDP-1, 1366x768@60, 0x0, 1"
        "HDMI-1, 1920x1080@120, 0x0, 1"
      ];

      "$terminal" = "kitty";
      "$browser" = "firefox";
      "$files" = "nautilus";
      "$editor" = "code";

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
        "$mod, C, exec, $terminal"
        "$mod, M, exit,"
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mod, Q, killactive,"
        "$mod, S, exec, $editor"
        "$mod, Return, fullscreen, 1"
        "$mod, Tab, togglefloating,"
        "$mod, mouse:274, splitratio, exact 1.0"
        "$mod SHIFT, W, exec, switch-wallpaper.sh"
        "$mod, B, exec, $browser"
        "$mod, F, exec, $files"

        # Switch to next/previous workspace on monitor
        "CONTROL $mod, right, workspace, r+1"
        "CONTROL $mod, up, workspace, r+1"
        "CONTROL $mod, left, workspace, r-1"
        "CONTROL $mod, down, workspace, r-1"

        # Move focus
        "$mod, up, movefocus, u"
        "$mod, right, movefocus, r"
        "$mod, down, movefocus, d"
        "$mod, left, movefocus, l"

        # Swap windows
        "$mod ALT, up, swapwindow, u"
        "$mod ALT, right, swapwindow, r"
        "$mod ALT, down, swapwindow, d"
        "$mod ALT, left, swapwindow, l"

        # Alt-Tab feature
        "ALT, Tab, cyclenext,"
        "ALT, Tab, bringactivetotop,"
      ];

      bindr = [
        "SUPER, Super_L, exec, pkill rofi || rofi -show drun"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        # Change brightness
        ", XF86MonBrightnessUp, exec, xbacklight +5"
        ", XF86MonBrightnessDown, exec, xbacklight -5"

        # Change audio volume
        ", XF86AudioRaiseVolume, exec, pamixer -i 1"
        ", XF86AudioLowerVolume, exec, pamixer -d 1"
        "CONTROL, XF86AudioRaiseVolume, exec, pamixer -i 5"
        "CONTROL, XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute, exec, pamixer -t"
      ];
    };
  };
}
