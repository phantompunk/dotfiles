return {
	"github/copilot.vim",
	event = "InsertEnter",
	config = function()
		vim.g.copilot_enabled = false

		-- Add the toggle keymap
		vim.keymap.set("n", "<leader>cp", function()
			vim.g.copilot_enabled = not vim.g.copilot_enabled

			if vim.g.copilot_enabled then
				vim.cmd("Copilot enable")
				vim.notify("Copilot enabled", vim.log.levels.INFO)
			else
				vim.cmd("Copilot disable")
				vim.notify("Copilot disabled", vim.log.levels.WARN)
			end
		end, { desc = "Toggle Copilot" })
	end,
}
