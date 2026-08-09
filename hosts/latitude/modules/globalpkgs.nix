{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  # Temporary overlay for fixing build issues caused by the "python311" package

  nixpkgs.overlays = [
    (final: prev: {
      python311 =
        prev.python311
        // {
          doc = prev.runCommand "python3.11-3.11.15-doc" {} ''
            mkdir -p $out
          '';
        };
    })
  ];

  # Programs installed in the system profile

  environment.systemPackages = with pkgs; [
    vim
    wget
    gcc
    htop
    nix-search-cli
    hyprpolkitagent
    python3
    udiskie
    acpilight
    alsa-utils
    #dialog
    #iproute2
    #libnotify
    #netcat-gnu
    #openssl
    #openssl_3
    #openssl_legacy
    texliveMedium
    python311
    virtualenv
    ffmpeg
    deno

    # SDR related
    /*
    sox
    tinycc
    netcat-openbsd
    rtl-sdr
    gnuradio
    */
  ];

  programs = {
    firefox.enable = true;

    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        udev
        zlib
      ];
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
  ];
}
