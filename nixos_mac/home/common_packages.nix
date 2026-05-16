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
  ripgrep
  gnumake
  nixpkgs-fmt
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
  go
  rustc
  nodejs

  # IDEs
  jetbrains.clion
  jetbrains.idea-oss

  # nvim
  luajit
  luarocks
  lazygit

  # cloud
  google-cloud-sdk
]
