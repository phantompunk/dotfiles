return {
  "github/copilot.vim",
  config = function()
    -- Your existing Copilot config here
    vim.g.copilot_enabled = false
    -- Add the toggle keymap
    vim.keymap.set("n", "<leader>cp", function()
      if vim.g.copilot_enabled == false then
        vim.cmd("Copilot enable")
        vim.g.copilot_enabled = true
        vim.notify("Copilot enabled", vim.log.levels.INFO)
      else
        vim.cmd("Copilot disable")
        vim.g.copilot_enabled = false
        vim.notify("Copilot disabled", vim.log.levels.INFO)
      end
    end, { desc = "Toggle Copilot" })
  end,
}
