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

  home.stateVersion = "24.11";
}
