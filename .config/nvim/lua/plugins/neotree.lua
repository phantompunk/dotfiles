return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  opts = {
    width = "55%"
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      window = {
          position = "left",
          width = 25,
          mapping_options = {
            noremap = true,
            nowait = true,
          }
      }
    })
    vim.keymap.set('n', '<S-D-e>', ':Neotree toggle<CR>', {})
  end
}
