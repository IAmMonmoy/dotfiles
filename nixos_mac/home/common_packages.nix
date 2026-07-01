{ pkgs }:

let
  inherit (pkgs) lib stdenv;
in

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
  codex
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
  libiconv
  rustc
  rustlings
  cargo
  rustfmt
  clippy
  rust-analyzer
  nodejs

  # IDEs
  zed-editor
  vscode
  jetbrains.pycharm

  # nvim
  luajit
  luarocks
  lazygit

  # cloud
  google-cloud-sdk
] ++ lib.optionals (!stdenv.hostPlatform.isAarch64 || !stdenv.hostPlatform.isDarwin) [
  # idea-oss currently pulls a JetBrains JDK that is unsupported on aarch64-darwin.
]
