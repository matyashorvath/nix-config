let
  homePath = "/home/matyashorvath";
in {
  programs.git = {
    enable = true;
    settings = {
      user.name = "matyashorvath";
      user.email = "99116949+matyashorvath@users.noreply.github.com";
    };
    signing = {
      format = "ssh";
      key = "${homePath}/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
  };
}
