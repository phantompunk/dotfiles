return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    style = "night",       -- storm, moon, night, day
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
    },
  },
  {
    "connorholyday/vim-snazzy",
    lazy = true,
    name = "snazzy",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
}
