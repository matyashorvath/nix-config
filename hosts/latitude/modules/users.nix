{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  # Extra groups
  users.groups.nixconf = {};

  # User accounts
  # Don't forget to set a password with ‘passwd’!
  users.users.matyashorvath = {
    isNormalUser = true;
    description = "Mátyás Horváth";
    extraGroups = ["networkmanager" "wheel" "nixconf"];
    packages = with pkgs; [];
  };
}
