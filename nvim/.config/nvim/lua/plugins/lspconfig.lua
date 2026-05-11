return { -- language support
  "neovim/nvim-lspconfig",
  dependencies = {
      { "hrsh7th/cmp-nvim-lsp", lazy = true },
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    vim.lsp.config["clangd"] = {
      capabilities = capabilities,
      cmd = {
        "clangd", "--inlay-hints=false",
      },
      on_attach = function(client, bufnr)
        require("inlay-hints").on_attach(client, bufnr)
      end,

      settings = {
        clangd = {
          InlayHints = {
            Enabled = true,
            ParameterNames = true,
            DeducedTypes = false,
            Designators = false,
          },
          fallbackFlags = { "-std=c++20" },
        },
      },
    }
    vim.lsp.config["clangd"] = {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        require("inlay-hints").on_attach(client, bufnr)
      end,
    }

    vim.lsp.enable({
      "lua_ls",
      "pylsp",
      "rust_analyzer",
      "clangd",
      "roslyn",
    })
  end,
  
} 
