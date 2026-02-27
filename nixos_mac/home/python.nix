{ pkgs, ... }:

{
  home.packages = [
    (pkgs.python3.withPackages (ps: with ps; [
      notebook
      langchain
    ]))
  ];
}
