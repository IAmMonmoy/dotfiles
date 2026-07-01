{ pkgs, ... }:

{
  home.packages = [
    (pkgs.python3.withPackages (import ./pip_packages.nix))
  ];
}
