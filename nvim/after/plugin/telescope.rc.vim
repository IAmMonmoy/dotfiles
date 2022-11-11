if !exists('g:loaded_telescope') | finish | endif

nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap  <silent> ;gf <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap  <silent> ;fb <cmd>lua require('telescope.builtin').file_browser()<cr> 
nnoremap  <silent> ;mc <cmd>lua require('telescope').extensions.metals.commands()<cr> 
nnoremap  <silent> ;b <cmd>Telescope buffers<cr>
nnoremap  <silent> ;; <cmd>Telescope help_tags<cr>
nnoremap  <silent> ;ds <cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>
nnoremap  <silent> ;ws <cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
   file_ignore_patterns = { "target", "node_modules" },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF

