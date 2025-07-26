# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# This configuration is designed for macOS using nix-darwin.
# For more information, see: https://github.com/LnL7/nix-darwin

{ config, lib, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
  ];

  environment.variables.EDITOR = "vim";
}
