require("config.lazy")

vim.opt.expandtab = true  -- Use spaces instead of tabs for indentation
vim.opt.tabstop = 2      -- Number of spaces a tab character represents
vim.opt.shiftwidth = 2   -- Number of spaces to use for each step of indentation
vim.opt.softtabstop = 2  -- Number of spaces to use for <Tab> and <BS> in insert mode

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
