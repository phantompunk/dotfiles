require("keymaps")
require("options")
require("config.lazy")

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

-- Enable word wrap on Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.wrap = true
  end,
})

-- Autosave files when text changes or leaving the buffer
local function save()
  local buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_buf_call(buf, function()
    vim.cmd("silent! write")
  end)
end

vim.api.nvim_create_augroup("AutoSave", {
  clear = true,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    save()
  end,
  pattern = "*",
  group = "AutoSave",
})
