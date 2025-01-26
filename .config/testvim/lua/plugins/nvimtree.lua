return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "echasnovski/mini.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("nvim-tree").setup({
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
        dotfiles = true,
      },
    })
    vim.keymap.set("n", "<S-D-e>", ":NvimTreeFindFileToggle<CR>", {})
  end,
}
