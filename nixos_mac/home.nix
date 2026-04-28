{ pkgs
, username
, homeDirectory
, stateVersion
, ...
}:

{
  imports = [
    ./home/fish.nix
    ./home/git.nix
    ./home/nvim.nix
    ./home/tmux.nix
    ./home/python.nix
    ./home/java.nix
  ];

  home = {
    inherit username homeDirectory stateVersion;

    packages = import ./home/common_packages.nix { inherit pkgs; };
  };

  programs.man.generateCaches = false;
}
