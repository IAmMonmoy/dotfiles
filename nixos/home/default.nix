{ config, pkgs, ... }:


{
	imports = [
    ./git.nix
	];

  home = {
	  username = "nixos";

	  homeDirectory = "/home/nixos";

	  packages = with pkgs; [
	    # archives

	    zip

	    unzip


	    # utils

	    ripgrep # recursively searches directories for a regex pattern

	    jq # A lightweight and flexible command-line JSON processor

	    eza # A modern replacement for ‘ls’

	    fzf # A command-line fuzzy finder


	    # productivity

	    btop
      tmux
      fish
      ghq
      peco
      neovim
      libgcc
      gcc
      jdk21
      go
      rustc
	  ];


	  stateVersion = "23.11";
	  enableNixpkgsReleaseCheck = false;
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
