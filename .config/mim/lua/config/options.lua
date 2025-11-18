-- Options 

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Basic Settings
vim.wo.number = true -- Make line numbers default
vim.opt.wrap = false -- Disable line wrapping
vim.opt.scrolloff = 8 -- Minimum number of lines above or below cusor
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.relativenumber = true -- Lines numbers are relative to cursor

-- Visual Settings
vim.opt.termguicolors = true -- optionally enable 24-bit colour


-- Indentation 
vim.o.tabstop = 2 -- Number of spaces that tab uses
vim.o.softtabstop = 2 -- Number of spaces that tab uses in insert mode
vim.o.shiftwidth = 2 -- Number of spaces used for auto indent
vim.o.expandtab = true -- Insert spaces instead of tab
vim.o.breakindent = true -- Enable break indent

-- Behavior settings
vim.o.mouse = "a" -- Enable mouse mode
vim.opt.backspace = "indent,eol,start"

-- File handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.undofile = true -- Save undo history
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Time to wait for a mapped sequence (ms)
vim.opt.ttimeoutlen = 0 -- Time to wait for a mapped sequence (ms)

-- Search settings
vim.o.hlsearch = false -- Set highlight on search
vim.o.smartcase = true -- Override ignorecase if search has uppercase
vim.o.incsearch = true -- Enable incremental search
vim.o.ignorecase = true -- Ignore case in search patterns

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1

