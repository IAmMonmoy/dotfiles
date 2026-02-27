{
  pkgs,
  ...
}: {
  # Ensure all required packages are installed
  home.packages = with pkgs; [
    fish
    gh
    peco
    perl  # Required for peco directory changing
    findutils  # For find command
    gnused  # For sed in fish history
    coreutils  # For sort and other core utilities
  ];

  # Configure Fish shell
  programs.fish = {
    enable = true;

    # Set Fish as the default shell
    shellInit = ''
      # Set the shell to the Fish from Nix store
      set -gx SHELL ${pkgs.fish}/bin/fish

      # Only set as default shell if not already set and we're in an interactive session
      if status is-interactive && ! string match -q "*${pkgs.fish}/bin/fish" (cat /etc/shells 2>/dev/null || true)
        echo ${pkgs.fish}/bin/fish | sudo tee -a /etc/shells >/dev/null
        chsh -s ${pkgs.fish}/bin/fish
      end

      # Ensure Nix paths are in PATH
      set -gx PATH $HOME/.nix-profile/bin /nix/var/nix/profiles/default/bin $PATH
    '';

    interactiveShellInit = ''
      set -gx SHELL ${pkgs.fish}/bin/fish
      set fish_greeting
    '';

    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";
      v = "nvim";
    };

    functions = {
      fish_user_key_bindings = ''
        bind \cr peco_select_history
        bind \cf peco_change_directory
      '';

      fish_prompt = ''
        set_color blue
        echo -n (prompt_pwd)
        set_color normal
        echo -n ' > '
      '';

      _peco_change_directory = ''
        if [ (count $argv) ]
          ${pkgs.peco}/bin/peco --layout=bottom-up --query "$argv " | ${pkgs.perl}/bin/perl -pe 's/([ ()])/\\\\$1/g' | read foo
        else
          ${pkgs.peco}/bin/peco --layout=bottom-up | ${pkgs.perl}/bin/perl -pe 's/([ ()])/\\\\$1/g' | read foo
        end

        if [ $foo ]
          builtin cd $foo
          commandline -r ""
          commandline -f repaint
        else
          commandline ""
        end
      '';

      peco_change_directory = ''
        begin
          echo $HOME/.config
          ${pkgs.ghq}/bin/ghq list -p
          ${pkgs.findutils}/bin/find . -maxdepth 1 -type d -not -name '.*' -exec echo {}/ \;
        end | ${pkgs.gnused}/bin/sed -e 's/\/$//' | ${pkgs.coreutils}/bin/awk '!a[$0]++' | _peco_change_directory $argv
      '';

      peco_select_history = ''
        if test (count $argv) = 0
          set peco_flags --layout=bottom-up
        else
          set peco_flags --layout=bottom-up --query "$argv"
        end

        history | ${pkgs.peco}/bin/peco $peco_flags | read foo

        if [ $foo ]
          commandline $foo
        else
          commandline ""
        end
      '';
    };

    # Properly formatted plugins section
    plugins = [
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "85f863f20f24faf675827fb00f3a4e15c7838d76";
          sha256 = "sha256-+FUBM7CodtZrYKqU542fQD+ZDGrd2438trKM0tIESs0=";
        };
      }
    ];
  };

  # If macOS still launches zsh, hand off to fish for interactive sessions.
  programs.zsh = {
    enable = true;
    initExtra = ''
      if [[ -o interactive ]] && command -v fish >/dev/null 2>&1; then
        exec fish
      fi
    '';
  };
}
