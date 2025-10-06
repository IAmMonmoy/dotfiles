{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      jupyterlab
      ipykernel
      numpy
      pandas
      matplotlib
    ]))
  ];
}
