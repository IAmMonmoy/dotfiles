{
  pkgs,
  ...
}: {

  home.packages = [pkgs.gh];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      bind \cr peco_select_history # Bind for peco select history to Ctrl+R
      bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F
    '';
    
    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";
      v = "nvim";
    };

    functions = {
      fish_prompt = ''
        set_color blue
        echo -n (prompt_pwd)
        set_color normal
        echo -n ' > '
      '';

      _peco_change_directory = ''
        if [ (count $argv) ]
          peco --layout=bottom-up --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'|read foo
        else
          peco --layout=bottom-up |perl -pe 's/([ ()])/\\\\$1/g'|read foo

        end

        if [ $foo ]
          builtin cd $foo

          commandline -r '''

          commandline -f repaint
        else
      commandline '''
        end
      '';

      peco_change_directory = ''
        echo "Rajob"
        begin
          echo $HOME/.config
          ghq list -p
          ls -ad */|perl -pe "s#^#$PWD/#"|grep -v \.git
        end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory $argv
      '';

      peco_select_history = ''
         if test (count $argv) = 0
          set peco_flags --layout=bottom-up
        else
          set peco_flags --layout=bottom-up --query "$argv"
        end

        history|peco $peco_flags|read foo

        if [ $foo ]

          commandline $foo

        else
          commandline '''
        end '';
    };
    
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
}
