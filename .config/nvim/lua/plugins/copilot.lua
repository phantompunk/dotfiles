return {
	"github/copilot.vim",
	event = "InsertEnter",
	config = function()
		-- Add the toggle keymap
		vim.keymap.set("n", "<leader>cp", function()

			if vim.fn["copilot#Enabled"]() == 1 then
				vim.cmd("Copilot disable")
				vim.notify("Copilot disabled", vim.log.levels.WARN)
			else
				vim.cmd("Copilot enable")
				vim.notify("Copilot enabled", vim.log.levels.INFO)
			end
		end, { desc = "Toggle Copilot" })
	end,
}
