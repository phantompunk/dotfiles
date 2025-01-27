return {
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- "gc" to comment visual regions/lines
  -- 'numToStr/Comment.nvim', opts = {} },

  -- Install Catppuccin theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Install theme inspired by Hyper Term
  { "connorholyday/vim-snazzy", name = "snazzy", lazy = false, priority = 1000 },

  -- Adds collections of small useful plugins
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = { enabled = true },
      indent = { enabled = true },
      terminal = { enabled = true },
    },
  },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { },
  },

  -- Collection of various small independent plugins/modules
  { 
    "echasnovski/mini.nvim",
    config = function()
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()
    end,
  },
}
