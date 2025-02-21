require("keymaps")
require("options")
require("config.lazy")

print("Theme", vim.env.theme)
-- Enable light/dark theme toggle
local theme = vim.env.theme == "light" and "catppuccin-latte" or "snazzy"
local ok, _ = pcall(vim.cmd, "colorscheme " .. theme)
if not ok then
  vim.notify("Failed to load colorscheme: " .. theme, vim.log.levels.WARN)
end

-- Handle Go template files 'tmpl' as 'html'
vim.api.nvim_create_autocmd("FileType", {
  pattern = "template",
  callback = function()
    vim.bo.filetype = "html"
  end,
})
