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

  home = {
    username = "matyashorvath";
    homeDirectory = "/home/matyashorvath";

    sessionPath = [
      "$HOME/Scripts/global"
      "$HOME/Scripts/local"
    ];

    stateVersion = "24.11";
  };
}
