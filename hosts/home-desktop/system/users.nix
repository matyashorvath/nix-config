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
    description = "Matyas Horvath";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      kdePackages.kate
      gparted
      #  thunderbird
    ];
  };
}
