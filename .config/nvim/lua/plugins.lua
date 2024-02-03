return {
  'tpope/vim-sleuth',
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- {
  --   config=function()
  --     -- [[ Highlight on yank ]]
  --     -- See `:help vim.highlight.on_yank()`
  --     local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  --     vim.api.nvim_create_autocmd('TextYankPost', {
  --       callback = function()
  --         vim.highlight.on_yank()
  --       end,
  --       group = highlight_group,
  --       pattern = '*',
  --     })
  --   end
  -- },
--  {
   -- require 'kickstart.plugins.autoformat',
   -- require 'kickstart.plugins.debug',
--  },
--  {
--    -- Set lualine as statusline
--    'nvim-lualine/lualine.nvim',
--    -- See `:help lualine.txt`
--    opts = {
--      options = {
--        icons_enabled = false,
--        theme = 'auto',
--        component_separators = '|',
--        section_separators = '',
--      },
--    },
--  },
}
