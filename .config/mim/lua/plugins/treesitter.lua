return {
  {
    -- highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "diff",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "sql",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      -- autoinstall languages that are not installed
      auto_install = false,
      -- install languages synchronously (only applied to `ensure_installed`)
      sync_install = false,
      highlight = {
        enable = true,
        -- some languages depend on vim's regex highlighting system (such as ruby) for indent rules.
        --  if you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
    },
  },
}
