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
      helix
      bat
      glow

      #Languages related
      libgcc
      gcc
      jdk21
      maven
      go
      rustc
      nodejs

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
