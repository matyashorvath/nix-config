{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  networking.wireguard = {
    enable = true;
    interfaces = {
      wg0 = {
        ips = ["10.0.0.4/32"];
        listenPort = 39680;
        privateKeyFile = "/etc/nixos/secrets/wg-keys/lat";

        peers = [
          {
            publicKey = builtins.readFile ../../../secrets/wg-keys/rpi.pub;
            allowedIPs = ["10.0.0.0/32"];
            endpoint = "floppa.dnet.hu:39680";
            persistentKeepalive = 25;
          }
          {
            publicKey = builtins.readFile ../../../secrets/wg-keys/pc.pub;
            allowedIPs = ["10.0.0.2/32"];
            endpoint = "floppa.dnet.hu:39681";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };
}