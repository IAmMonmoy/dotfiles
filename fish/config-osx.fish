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
alias k  "kubectl"
alias vm "v ~/.config/nvim/maps.vim"
alias vp "v ~/.config/nvim/plug.vim"
alias vi "v ~/.config/nvim/init.vim"
alias fm "v ~/.config/fish/config-osx.fish"
alias gc "git checkout"
alias gm "git commit -m"
alias ga "git add ."
