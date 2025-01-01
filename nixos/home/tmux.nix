{
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
      set -g default-shell /etc/profiles/per-user/nixos/bin/fish
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
}
