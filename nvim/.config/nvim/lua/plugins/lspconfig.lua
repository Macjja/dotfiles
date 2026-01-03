return { -- language support
  "neovim/nvim-lspconfig",
  dependencies = {
      { "hrsh7th/cmp-nvim-lsp", lazy = true },
  },
  config = function()
    vim.lsp.enable({
      "lua_ls",
      "pylsp",
      "rust_analyzer",
      "clangd"
    })
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    vim.lsp.config('<YOUR_LSP_SERVER>', {
      capabilities = capabilities
    })
    vim.lsp.enable('<YOUR_LSP_SERVER>')
  end,
} 
