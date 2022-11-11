-- local M = {}
--
-- local whichkey = require "which-key"
-- local next = next
--
-- local conf = {
--   window = {
--     border = "single", -- none, single, double, shadow
--     position = "bottom", -- bottom, top
--   },
-- }
-- whichkey.setup(conf)
--
-- local function code_keymap()
--   if vim.fn.has "nvim-0.7" then
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "*",
--       callback = function()
--         vim.schedule(CodeRunner)
--       end,
--     })
--   else
--     vim.cmd "autocmd FileType * lua CodeRunner()"
--   end
--
--   function CodeRunner()
--     local bufnr = vim.api.nvim_get_current_buf()
--     local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
--     local fname = vim.fn.expand "%:p:t"
--     local keymap_c = {} -- normal key map
--     local keymap_c_v = {} -- visual key map
--
--     if ft == "java" then
--       keymap_c = {
--         name = "Code",
--         o = { "<cmd>lua require'jdtls'.organize_imports()<cr>", "Organize Imports" },
--         v = { "<cmd>lua require('jdtls').extract_variable()<cr>", "Extract Variable" },
--         c = { "<cmd>lua require('jdtls').extract_constant()<cr>", "Extract Constant" },
--         t = { "<cmd>lua require('jdtls').test_class()<cr>", "Test Class" },
--         n = { "<cmd>lua require('jdtls').test_nearest_method()<cr>", "Test Nearest Method" },
--       }
--       keymap_c_v = {
--         name = "Code",
--         v = { "<cmd>lua require('jdtls').extract_variable(true)<cr>", "Extract Variable" },
--         c = { "<cmd>lua require('jdtls').extract_constant(true)<cr>", "Extract Constant" },
--         m = { "<cmd>lua require('jdtls').extract_method(true)<cr>", "Extract Method" },
--       }
--     end
--
--     if next(keymap_c) ~= nil then
--       whichkey.register(
--         { c = keymap_c },
--         { mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>", nowait = true }
--       )
--     end
--
--     if next(keymap_c_v) ~= nil then
--       whichkey.register(
--         { c = keymap_c_v },
--         { mode = "v", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>", nowait = true }
--       )
--     end
--   end
-- end
--
-- function M.setup()
--   code_keymap()
-- end
--
-- return M
