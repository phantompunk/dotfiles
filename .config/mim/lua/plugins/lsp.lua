return {
  -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- Mason package manager for LSP servers, DAP servers, linters and formatters 
  -- { "mason-org/mason.nvim", opts = {} },
  -- { "mason-org/mason-lspconfig.nvim", opts = {} },
  
  -- { "j-hui/fidget.nvim", opts = {} },
  -- { "hrsh7th/cmp-nvim-lsp", opts = {} },

  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     vim.lsp.enable('gopls')
  --   end,
  -- }
}
