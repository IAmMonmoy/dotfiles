{
  pkgs,
  ...
}: {
  home.packages = [pkgs.gh];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-unwrapped;

    extraPackages = with pkgs; [
      ripgrep
      fd
      gcc
      nodejs
      python3
      tree-sitter
    ];

     extraConfig = ''
      lua << EOF
      -- bootstrap lazy.nvim
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
          "git",
          "clone",
          "--filter=blob:none",
          "https://github.com/folke/lazy.nvim.git",
          "--branch=stable",
          lazypath,
        })
      end
      vim.opt.rtp:prepend(lazypath)

      -- setup lazy.nvim
      require("lazy").setup({
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- your plugins
         { import = "lazyvim.plugins.extras.lang.java" },
         { import = "lazyvim.plugins.extras.lang.go" },
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
      })
      EOF
    '';

    extraLuaConfig = ''
      -- Load LazyVim configuration
      require("lazyvim.config").setup({})

      -- Set colorscheme
      vim.cmd.colorscheme "catppuccin-mocha"
    '';
  };
}
