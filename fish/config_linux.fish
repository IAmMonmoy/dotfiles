if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
  alias llg "exa --long --git"

  alias llt "exa --tree --level=2"
  alias lltl "exa --tree --level=2 --long"
end

alias v nvim
alias ta "tmux attach-session -t"
alias tn "tmux new-session"
alias cf "cd ~/.config"
alias cfv "cd ~/.config/nvim"
alias cff "cd ~/.config/fish/"
