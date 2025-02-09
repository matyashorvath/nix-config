let
  homePath = "/home/matyashorvath";
in {
  programs.git = {
    enable = true;
    userName = "matyashorvath";
    userEmail = "99116949+matyashorvath@users.noreply.github.com";
    extraConfig = {
      credential.helper = "oauth";
      gpg.format = "ssh";
      user.signingkey = "${homePath}/.ssh/id_ed25519.pub";
    };
  };
}
