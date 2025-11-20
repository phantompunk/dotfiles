return {
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

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
      on_attach = function()
        local gs = package.loaded.gitsigns
        vim.keymap.set("n", "<leader>gp", gs.preview_hunk_inline, { desc = "Preview Hunk Inline" })
        vim.keymap.set("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
        vim.keymap.set("n", "<leader>gR", gs.reset_hunk, { desc = "Reset current hunk" })
      end,
    },
  },

  -- Collection of various small independent plugins/modules
  {
    "echasnovski/mini.nvim",
    version = "*",
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

  -- Enable automatic session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
  },
}

