{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  dconf.settings = {
    "org/gnome/interface" = {
      cursor-theme = "Future-cursors";
      cursor-size = 24;
    };
  };
}
