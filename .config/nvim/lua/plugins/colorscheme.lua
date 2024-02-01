return {
  {
    -- Theme inspired by Hyper Term
    'connorholyday/vim-snazzy',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'snazzy'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        if os.getenv 'theme' == 'light' then
            local status, _ = pcall(vim.cmd, 'colorscheme catppuccin-latte')
            if not status then
                print 'Colorscheme theme not found!'
                return
            end
        end
    end,
  },
}
