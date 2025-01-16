{
  pkgs,

  ...

}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    userName = "IAmMonmoy";
    userEmail = "rajob.raihan@outlook.com";
  };
}
