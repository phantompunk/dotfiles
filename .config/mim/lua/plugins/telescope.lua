return {
  { 
    -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { 
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    opts = {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)

      -- Enable Telescope extensions if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")
    end,
    keys = {
      { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep" },
      { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "[S]earch [R]esume" },
      { "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "[ ] Find existing buffers" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "[S]earch [H]elp" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[S]earch [K]emaps" },
      { "<leader>ss", "<cmd>Telescope builtin<cr>", desc = "[S]earch [S]elect Telescope" },
      { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch Current [W]ord" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics" },
      { "<leader>s.", "<cmd>Telescope find_files<cr>", desc = '[S]earch Recent files ("." for repeat)' },
      { 
        "<leader>sn",
        function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "[S]earch [N]eovim files",
      },
    },
  },
}

