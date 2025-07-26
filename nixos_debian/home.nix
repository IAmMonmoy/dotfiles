{ config, pkgs, ... }:

{
	imports = [
    ./home/fish.nix
    ./home/git.nix
    ./home/nvim.nix
    ./home/tmux.nix
	];

  home = {
	  username = "rajob";
	  homeDirectory = "/home/rajob";

	  packages = with pkgs; [
	    # archives
	    zip
	    unzip
      wget

	    # utils
	    jq # A lightweight and flexible command-line JSON processor
	    eza # A modern replacement for ‘ls’
	    fzf # A command-line fuzzy finder
      curl
      gnumake
      luajitPackages.fzf-lua

	    # productivity
	    btop
      tmux
      fish
      ghq
      peco
      eza
      tree-sitter 

      #Languages related
      libgcc
      gcc
      jdk23
      go
      rustc
      nodejs
      python3

      #nvim related
      luajit
      luarocks
      lazygit

      #cloud
      google-cloud-sdk
        
      #containers
      containerd
      nerdctl
	  ];

	  stateVersion = "23.11";
  };
}
