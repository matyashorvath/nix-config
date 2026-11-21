{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "dotnet-sdk-6.0.428"
      "dotnet-runtime-6.0.36"
    ];
  };

  programs = {
    kdeconnect.enable = true;
    steam.enable = true;
    partition-manager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    (vscode.fhsWithPackages (
      ps:
        with ps; [
          SDL2
          SDL2.dev
          pkg-config
          libusb1
          libusb1.dev
          udev
          udev.dev
        ]
    ))
    (python3.withPackages (python-pkgs:
      with python-pkgs; [
        tkinter
      ]))
    vim
    wget
    git
    fastfetch
    gparted
    git-crypt
    gnumake
    gdb
    wineWow64Packages.waylandFull
    nsnake
    htop
    openra
    nix-search-cli
    poppler-utils
    pdftk
    texliveFull
    cmake
    ninja
    gperf
    ccache
    dfu-util
    dtc
    file
    gcc
    psmisc
    jdk
  ];
}
