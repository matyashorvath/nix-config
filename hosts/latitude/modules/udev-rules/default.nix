{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  services.udev.extraRules = ''
    ${builtins.readFile ./radio.rules}
    ${builtins.readFile ./silabs.rules}
    ${builtins.readFile ./jlink.rules}
  '';
}
