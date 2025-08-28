{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  # Extra groups
  users.groups.video = {};
  users.groups.plugdev = {};

  # User accounts
  # Don't forget to set a password with ‘passwd’!
  users.users.matyashorvath = {
    isNormalUser = true;
    description = "Mátyás Horváth";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "plugdev"
    ];
    packages = with pkgs; [];
  };

  # Required for backlight to be controllable by users
  services.udev.extraRules = ''
    SUBSYSTEM=="backlight", ACTION=="add", \
    RUN+="${pkgs.coreutils-full}/bin/chgrp video /sys/class/backlight/%k/brightness", \
    RUN+="${pkgs.coreutils-full}/bin/chmod g+w /sys/class/backlight/%k/brightness"
  '';
}
