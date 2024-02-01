-- [[ Kickstart.nvim ]]
--  Kickstart.nvim is *not* a distribution.
--  Kickstart.nvim is a template for your own configuration.

-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins")

-- [[ Setting options ]]
-- See `:help vim.o`
vim.o.relativenumber = true   -- Lines numbers are relative to cursor
vim.o.tabstop = 2             -- Number of spaces that tab uses
vim.o.softtabstop = 2         -- Number of spaces that tab uses in insert mode
vim.o.shiftwidth = 2          -- Number of spaces used for auto indent
vim.o.expandtab = true        -- Insert spaces instead of tab
vim.o.wrap = false            -- Disable line wrapping
vim.o.incsearch = true        -- Enable incremental search
vim.o.scrolloff = 8           -- Minimum number of lines above or below cusor
vim.o.hlsearch = false        -- Set highlight on search
vim.wo.number = true          -- Make line numbers default
vim.o.mouse = 'a'             -- Enable mouse mode
vim.o.breakindent = true      -- Enable break indent
vim.o.undofile = true         -- Save undo history
vim.o.termguicolors = true    -- Make sure your terminal supports this
--vim.wo.signcolumn = 'yes'     -- Keep signcolumn on by default
--vim.opt.colorcolumn = "80"    -- Vertical ruler highlights column

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]

vim.keymap.set("v", "∆", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "˚", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle when jump up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep next search term in th middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to os clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

