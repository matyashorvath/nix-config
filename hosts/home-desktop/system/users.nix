{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.matyashorvath = {
    isNormalUser = true;
    description = "Mátyás Horváth";
    extraGroups = ["networkmanager" "wheel" "vboxusers"];
  };
}
