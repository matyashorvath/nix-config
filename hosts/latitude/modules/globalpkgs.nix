{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  # Install & configure system services here

  services = {
    # Enable the X11 windowing system.
    xserver.enable = true;

    displayManager.sddm.enable = true;

    # Enable the GNOME Desktop Environment.
    xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    xserver.xkb = {
      layout = "hu";
      variant = "";
    };

    # Enable CUPS to print documents.
    printing.enable = true;
  };

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
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
  ];
}
