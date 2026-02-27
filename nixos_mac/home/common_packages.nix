{ pkgs }:

with pkgs; [
  # archives
  zip
  unzip
  wget

  # utils
  jq
  eza
  fzf
  curl
  gnumake
  luajitPackages.fzf-lua

  # productivity
  btop
  tmux
  fish
  ghq
  peco
  tree-sitter

  # languages
  clang
  jdk25_headless
  go
  rustc
  nodejs

  # nvim
  luajit
  luarocks
  lazygit

  # cloud
  google-cloud-sdk
]
