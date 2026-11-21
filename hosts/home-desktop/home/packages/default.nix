{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
  ];

  programs = {
    home-manager.enable = true;

    firefox.enable = true;

    bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        wg-r = "sudo systemctl restart wireguard-wg0.service";
      };
    };
  };

  home.packages =
    (with pkgs; [
      thunderbird
      inputs.alejandra.defaultPackage.${system}
      chromium
      distrobox
      distrobox-tui
      inputs.winapps.packages."${system}".winapps
      gparted
      discord
      mpv
      telegram-desktop
      imhex
      kstars
      stellarium
      supertuxkart
      gimp3
      inkscape
      libreoffice-qt-fresh
      sunshine
      deluge
      viber
      audacity
      vlc
      obs-studio
      puddletag
      shotcut
      scantailor-universal
      wpsoffice
      stevia
      baobab
      qdirstat
      python313Packages.f3d
      openrocket
      dosbox
    ])
    ++ (with pkgs.kdePackages; [
      # KDE Plasma packages
      plasma-browser-integration
      kate
      wallpaper-engine-plugin
      kcalc
      kpat
      kmines
      krdc
      dragon
      k3b
      filelight
    ])
    ++ (with pkgs-stable; [
      kicad
      rpi-imager
    ]);
}
