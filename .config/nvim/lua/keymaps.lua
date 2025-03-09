-- Basic Keymaps

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move highlighted lines up/down
vim.keymap.set("v", "∆", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "˚", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle when jump up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep next search term in th middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to os clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Exit terminal mode
vim.api.nvim_set_keymap("t", "<Leader><ESC>", "<C-\\><C-n>", { noremap = true })

-- Execute current file
vim.keymap.set("n", "<leader>rr", ":below :term go run %<CR>", { desc = "Execute current Go file" })
vim.keymap.set(
  "n",
  "<leader>rt",
  ":below :term go test ./...<CR>",
  -- ":below :term go test $(basename % .go)_test.go<CR>",
  { desc = "Execute current Go file" }
)

-- vim.keymap.set(
--   "n",
--   "<leader>rt",
--   ":below :term go run $(dirname %)/$(basename % .go)_test.go<CR>",
--   { desc = "Execute current Go file" }
--   )
