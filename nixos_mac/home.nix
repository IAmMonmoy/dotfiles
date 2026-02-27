{ config, pkgs, ... }:

{
	imports = [
    ./home/fish.nix
    ./home/git.nix
    ./home/nvim.nix
    ./home/tmux.nix
    ./home/python.nix
	];

  home = {
	  username = "rajobraihan";
	  homeDirectory = "/Users/rajobraihan";

	  packages = import ./home/common_packages.nix { inherit pkgs; };

	  stateVersion = "23.11";
  };
}
