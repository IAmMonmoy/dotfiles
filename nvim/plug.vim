if has("vim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
  Plug 'folke/lsp-colors.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'mfussenegger/nvim-dap'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'scalameta/nvim-metals'

  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'

  " Telescope specific
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'lifepillar/vim-solarized8'
  Plug 'voldikss/vim-floaterm'
  Plug 'vim-test/vim-test'
  "
  "Nerdtree specific
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  Plug 'windwp/nvim-autopairs'
"  Plug 'nikvdp/neomux'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-surround'
"  Plug 'tpope/vim-unimpaired'
"  Plug 'tpope/vim-eunuch'
  Plug 'tomtom/tcomment_vim'
  Plug 'nvim-lualine/lualine.nvim'
"  Plug 'tommcdo/vim-lion'
"  Plug 'sickill/vim-pasta'
  Plug 'unblevable/quick-scope'
"  Plug 'tpope/vim-repeat'
"  Plug 'airblade/vim-rooter'
  Plug 'psliwka/vim-smoothie'
"  Plug 'AndrewRadev/splitjoin.vim'
"  Plug 'wellle/targets.vim'
"  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"  Plug 'folke/which-key.nvim'
  Plug 'mhinz/vim-startify'



  "Browser plugin
  "Plug 'glacambre/firenvim', { 'do': { _ -> firenvim"install(0) } }
endif

call plug#end()
