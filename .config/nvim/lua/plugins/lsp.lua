return {
	-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
	-- used for completion, annotations and signatures of Neovim apis
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	--
	-- LSP configurations
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			vim.lsp.enable({
				"gopls",
				"pyright",
			})
		end,
	},

	-- Mason package manager for LSP servers, DAP servers, linters and formatters
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"gopls",
				"pyright",
				"ruff",
			},
		},
	},

	-- Auto complete settings
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = { preset = "enter" },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			completion = {
				-- Auto-select first item
				list = {
					selection = { auto_insert = true }, -- or "preselect" if you want manual confirm
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},

	-- Linter configurations
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				python = { "ruff" },
				go = { "golangcilint" },
			}

			-- Create autocommand which carries out the actual linting
			-- on the specified events.
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					-- Only run the linter in buffers that you can modify in order to
					-- avoid superfluous noise, notably within the handy LSP pop-ups that
					-- describe the hovered symbol using Markdown.
					if vim.opt_local.modifiable:get() then
						lint.try_lint()
					end
				end,
			})
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function(_, opts)
			-- Add fold capabilities to LSP
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			-- Pass to LSP servers
			require("lspconfig.util").default_config.capabilities =
				vim.tbl_deep_extend("force", require("lspconfig.util").default_config.capabilities, capabilities)

			require("ufo").setup(opts)

			-- Keymaps
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zp", function()
				require("ufo").peekFoldedLinesUnderCursor()
			end, { desc = "Peek fold" })
		end,
	},
}
