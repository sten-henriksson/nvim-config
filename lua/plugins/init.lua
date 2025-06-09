return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- { import = "nvchad.blink.lazyspec" },
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autoconimplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    }
  }
  ,
{ 'vuciv/golf',lazy = false },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Existing
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",

        -- Added for Python
        "python",

        -- Added for Frontend
        "javascript",
        "typescript",
        "tsx", -- For TypeScript with JSX. The javascript parser often handles standard JSX.
        "json",
      },
   },
 },
}
