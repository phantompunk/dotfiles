-- Enable word wrap on Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.wrap = true
  end,
})

-- Set colorscheme after plugins are loaded
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local theme = vim.env.THEME == "light" and "catppuccin-latte" or "tokyonight-night"
    local ok, _ = pcall(vim.cmd.colorscheme, theme)
    if not ok then
      vim.notify("Failed to load colorscheme: " .. theme, vim.log.levels.WARN)
    end
  end,
})
