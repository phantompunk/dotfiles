-- Basic Keymaps

-- Move highlighted lines up/down
vim.keymap.set("v", "∆", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "˚", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle when jump up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep next search term in th middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- yank to os clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y')

-- Keymaps for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Exit terminal mode in the builtin terminal with Ctrl-q
-- Otherwise, you normally need to press <C-\><C-n>
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Exit terminal mode
vim.api.nvim_set_keymap("t", "<Leader><ESC>", "<C-\\><C-n>", { noremap = true })


-- Diagnostic keymaps
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
	{ desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
	{ desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics [Q]uickfix list" })

-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		async = true,
		lsp_fallback = true,
	})
end, { desc = "[C]ode [F]ormat" })

vim.keymap.set("n", "<leader>ci", function()
	vim.lsp.buf.code_action({
		apply = true,
		filter = function(action)
			return action.kind == "source.organizeImports"
		end,
	})
end, { desc = "[C]ode [I]mport sort" })

-- Toggle Blink Completions
local function toggle_cmp()
	vim.g.cmp_enabled = not vim.g.cmp_enabled
	vim.b.completion = vim.g.cmp_enabled
	if vim.g.cmp_enabled then
		vim.notify("blink-cmp enabled", vim.log.levels.INFO)
	else
		vim.notify("blink-cmp disabled", vim.log.levels.INFO)
	end
end
vim.keymap.set("n", "<leader>ct", toggle_cmp, { desc = "[C]ode [T]oggle cmp" })

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
--
vim.keymap.set("n", "<leader>rr", ":below :term go run %<CR>", { desc = "Execute current Go file" })
