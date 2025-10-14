{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  inputs,
  ...
}: {
  services = {
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
    };
    displayManager.autoLogin = {
      enable = true;
      user = "matyashorvath";
    };
    desktopManager.plasma6.enable = true;

    # Configure keymap in X11
    xserver.xkb = {
      layout = "hu";
      variant = "";
    };

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # Sunshine streaming
    sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
  };

  # Required for audio
  security.rtkit.enable = true;
}
