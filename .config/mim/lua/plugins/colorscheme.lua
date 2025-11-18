return {
  { 
    "connorholyday/vim-snazzy",
    name = "snazzy",
    lazy = false,
    priority = 1000, 
    config = function()
      -- Enable light/dark theme toggle
      local theme = vim.env.theme == "light" and "catppuccin-latte" or "snazzy"
      local ok, _ = pcall(vim.cmd, "colorscheme " .. theme)
      if not ok then
        vim.notify("Failed to load colorscheme: " .. theme, vim.log.levels.WARN)
      end
    end
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
