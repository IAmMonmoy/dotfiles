{
  lib,
  pkgs,
  ...
}: {
  home.packages = [pkgs.gh];

  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    clock24 = true;

    extraConfig = ''
      # Enable mouse control
      set -g mouse on
      set -g default-shell ${pkgs.fish}/bin/fish
    '';

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      vim-tmux-navigator
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-show-battery false
          set -g @dracula-show-weather false
        '';
      }
    ];
  };

  programs.fish.interactiveShellInit = lib.mkAfter ''
    if status is-interactive; and not set -q TMUX; and command -q tmux
      exec tmux new-session -A -s main
    end
  '';
}
