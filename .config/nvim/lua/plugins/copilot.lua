return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {}
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
-- return {
--   'github/copilot.vim',
--   opts = {
--     suggestion = { enabled = false },
--     panel = { enabled = false },
--     filetypes = {
--       markdown = true,
--       help = true,
--     },
--   },
-- }
--
-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   build = ":Copilot auth",
--   opts = {
--     suggestion = { enabled = false },
--     panel = { enabled = false },
--     filetypes = {
--       markdown = true,
--       help = true,
--     },
--   },
-- }
