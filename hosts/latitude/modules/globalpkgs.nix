{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  # Temporary overlay for fixing build issues caused by the "python311" package

  nixpkgs.overlays = [
    (final: prev: {
      python311 = prev.python311.overrideAttrs (old: {
        passthru =
          (old.passthru or {})
          // {
            doc = prev.python311.doc.overrideAttrs (docOld: {
              phases = ["installPhase"];
              installPhase = "mkdir -p $out";
            });
          };
      });
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
    (lib.lowPrio python311)
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

    (
      (vscode.override {
        commandLineArgs = "--ozone-platform=x11";
      })
      .fhsWithPackages (
        ps:
          with ps; [
            SDL2
            SDL2.dev
            pkg-config
            libusb1
            libusb1.dev
            udev
            udev.dev
            ncurses5
            ncurses
            zlib
            libxml2
            zstd
            brotli
          ]
      )
    )
    (python3.withPackages (python-pkgs:
      with python-pkgs; [
        tkinter
        pip
        ipykernel
        pandas
      ]))
    cmake
    ninja
    gperf
    ccache
    dfu-util
    dtc
    file
    psmisc
    libimobiledevice
    ifuse
    nodejs
    rclone
    minicom
    cutecom
    usbutils
  ];

  programs = {
    firefox.enable = true;

    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    /*
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    */

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        udev
        zlib
        libusb1
        ncurses5
        ncurses
        libxml2
        zstd
        brotli
      ];
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
  ];
}
