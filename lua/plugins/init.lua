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
  { 'vuciv/golf', lazy = false },
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
  {
    "mbbill/undotree",
    keys = {
      { "<leader>cc", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undo Tree" },
    },
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_ShortIndicators = 1
      vim.g.undotree_SplitWidth = 40
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
  -- Telescope-undo with Enter to restore
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>cx", "<cmd>Telescope undo<cr>", desc = "Telescope Undo History" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          undo = {
            use_delta = true,
            use_custom_command = nil,
            side_by_side = false,
            vim_diff_opts = { ctxlen = vim.o.scrolloff },
            entry_format = "state #$ID, $STAT, $TIME",
            time_format = "",
            saved_only = false,
            mappings = {
              i = {
                ["<cr>"] = require("telescope-undo.actions").restore,
                ["<C-y>"] = require("telescope-undo.actions").yank_additions,
                ["<C-r>"] = require("telescope-undo.actions").yank_deletions,
              },
              n = {
                ["<cr>"] = require("telescope-undo.actions").restore,
                ["y"] = require("telescope-undo.actions").yank_additions,
                ["Y"] = require("telescope-undo.actions").yank_deletions,
              },
            },
          },
        },
      })
      require("telescope").load_extension("undo")
    end,
  },
}
