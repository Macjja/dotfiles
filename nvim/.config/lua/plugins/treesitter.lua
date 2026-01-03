return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  opts = {
    highlight = { enable = true },
	  ensure_installed = {
	    "bash",
	    "c",
	    "cpp",
	    "diff",
	    "html",
	    "javascript",
	    "jsdoc",
	    "json",
	    "jsonc",
	    "lua",
	    "luadoc",
	    "luap",
	    "markdown",
	    "markdown_inline",
	    "printf",
	    "python",
	    "query",
	    "regex",
	    "toml",
	    "tsx",
	    "typescript",
	    "vim",
	    "vimdoc",
	    "xml",
	    "yaml",
	  },
  },
  config = function(_, opts)
    local TS = require("nvim-treesitter")

    -- setup treesitter
    TS.setup(opts)
    TS.install(opts.ensure_installed)

    vim.api.nvim_create_autocmd('FileType', {
          pattern = vim.treesitter.language.get_filetypes(lang),
	  callback = function() 
	    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	    pcall(vim.treesitter.start)
	  end,
	})


  end,
}
