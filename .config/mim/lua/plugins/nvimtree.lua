return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "echasnovski/mini.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<S-D-e>", ":NvimTreeFindFileToggle<CR>", desc = "Toggle NvimTree" },
  },
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
      custom = {
        "^.git$",
      },
    },
  },
}
