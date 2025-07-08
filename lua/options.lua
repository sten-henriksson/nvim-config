require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- Folding options
o.foldmethod = 'expr'    -- Use expression for folding
o.foldexpr = 'nvim_treesitter#foldexpr()'  -- Use treesitter for folding
o.foldlevel = 99         -- Start with all folds open
o.foldlevelstart = 99    -- Start with all folds open when opening files
o.foldenable = true      -- Enable folding

