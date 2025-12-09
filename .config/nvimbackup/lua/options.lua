-- Option Settings

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.relativenumber = true -- Lines numbers are relative to cursor
vim.o.tabstop = 2 -- Number of spaces that tab uses
vim.o.softtabstop = 2 -- Number of spaces that tab uses in insert mode
vim.o.shiftwidth = 2 -- Number of spaces used for auto indent
vim.o.expandtab = true -- Insert spaces instead of tab
vim.o.wrap = false -- Disable line wrapping
vim.o.incsearch = true -- Enable incremental search
vim.o.scrolloff = 8 -- Minimum number of lines above or below cusor
vim.o.hlsearch = false -- Set highlight on search
vim.wo.number = true -- Make line numbers default
vim.o.mouse = "a" -- Enable mouse mode
vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true -- Save undo history
vim.o.termguicolors = true -- optionally enable 24-bit colour
vim.o.ignorecase = true -- Ignore case in search patterns
vim.o.smartcase = true -- Override ignorecase if search has uppercase
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Time to wait for a mapped sequence (ms)

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1

-- Configure how new splits should be opened
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
-- vim.opt.inccommand = "split"

-- Show which line your cursor is on
-- vim.opt.cursorline = true

-- Diagnostic keymaps
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with Ctrl-q
-- Otherwise, you normally need to press <C-\><C-n>
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
