{
  pkgs,

  ...

}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    userName = "IAmMonmoy";
    userEmail = "rajob.raihan@outlook.com";

    extraConfig = {
      ghq = {
        root = "~/ghq";
      };

      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
      
      core = {
        sshCommand = "ssh -i ~/.ssh/id_ed25519";
      };
    };
  };
}
