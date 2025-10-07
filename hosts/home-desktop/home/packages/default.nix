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
      vscode
      thunderbird
      inputs.alejandra.defaultPackage.${system}
      vmware-workstation
      chromium
      distrobox
      distrobox-tui
      inputs.winapps.packages."${system}".winapps
      gparted
      kicad
      discord
      mpv
      telegram-desktop
      imhex
      kstars
      stellarium
      superTuxKart
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
      squeekboard
      rpi-imager
      baobab
      qdirstat
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
      partitionmanager
    ]);
}
