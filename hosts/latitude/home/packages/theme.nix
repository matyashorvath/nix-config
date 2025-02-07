{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: let
  variant = "mocha";
  accent = "mauve";

  gtkThemePackage = pkgs.catppuccin-gtk.override {
    accents = ["mauve"];
    inherit variant;
  };

  kvantumThemePackage = pkgs.catppuccin-kvantum.override {
    inherit variant accent;
  };
in {
  gtk = {
    enable = true;
    font.name = "TeX Gyre Heros";
    theme = {
      name = "catppuccin-${variant}-${accent}-standard";
      package = gtkThemePackage;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-${variant}-${accent}
    '';
    "Kvantum/catppuccin-${variant}-${accent}".source = "${kvantumThemePackage}/share/Kvantum/catppuccin-${variant}-${accent}";
  };
}
