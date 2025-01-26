require("keymaps")
require("options")
require("config.lazy")

-- Enable light/dark theme toggle
local theme = vim.env.THEME == "light" and "catppuccin-latte" or "snazzy"
local ok, _ = pcall(vim.cmd, "colorscheme " .. theme)
if not ok then
  vim.notify("Failed to load colorscheme: " .. theme, vim.log.levels.WARN)
end
