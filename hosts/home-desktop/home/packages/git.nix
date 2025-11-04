let
  homePath = "/home/matyashorvath";
in {
  programs.git = {
    enable = true;
    /*
    userName = "matyashorvath";
    userEmail = "99116949+matyashorvath@users.noreply.github.com";
    extraConfig = {
      gpg.format = "ssh";
      user.signingkey = "${homePath}/.ssh/id_rsa.pub";
    };
    */
    settings = {
      user.name = "matyashorvath";
      user.email = "99116949+matyashorvath@users.noreply.github.com";
      gpg.format = "ssh";
      user.signingkey = "${homePath}/.ssh/id_rsa.pub";
    };
  };
}
