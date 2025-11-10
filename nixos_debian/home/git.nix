{
  pkgs,
  ...
}: {
  home.packages = [pkgs.gh];
  
  programs.git = {
    enable = true;
    
    settings = {
      user.name = "IAmMonmoy";
      user.email = "rajob.raihan@outlook.com";
      
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
