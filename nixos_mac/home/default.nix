{ config, pkgs, ... }:

{
	imports = [
    ./fish.nix
    ./git.nix
    ./nvim.nix
    ./tmux.nix
	];

  home = {
	  username = "nixos";
	  homeDirectory = "/home/nixos";

	  packages = with pkgs; [
	    # archives
	    zip
	    unzip

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
      jdk21
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
	  ];

	  stateVersion = "23.11";
	  enableNixpkgsReleaseCheck = false;
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
