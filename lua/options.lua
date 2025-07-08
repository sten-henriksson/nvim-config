require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- Folding options
o.foldmethod = 'expr'    -- Use expression for folding
o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'  -- Use treesitter for folding (modern syntax)
o.foldlevel = 99         -- Start with all folds open
o.foldlevelstart = 99    -- Start with all folds open when opening files
o.foldenable = true      -- Enable folding

-- Set up an autocmd to ensure treesitter folding is applied after treesitter loads
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = "*",
  callback = function()
    if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] then
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
  end,
})

