{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  imports = [
    ./packages
  ];

  home.username = "matyashorvath";
  home.homeDirectory = "/home/matyashorvath";

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.stateVersion = "24.11";
}
