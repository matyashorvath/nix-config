{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

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

    # SDR related
    sox
    tinycc
    netcat-openbsd
    rtl-sdr
    gnuradio
  ];

  programs = {
    hyprland = {
      enable = true;
      # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    nix-ld.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
  ];
}
