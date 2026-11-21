{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  services.udev.extraRules = ''
    ${builtins.readFile ./silabs.rules}
    ${builtins.readFile ./jlink.rules}
  '';
}
