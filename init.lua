vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)
local lazy_config = require "configs.lazy"
-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)
-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
require "options"
require "nvchad.autocmds"

-- Create autocmd to set up gf to create files in markdown only
vim.schedule(function()
  require "mappings"
end)

require("toggleterm").setup{}

-- General Editor Options
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.scrolloff = 999 -- Keep cursor centered vertically

-- Folding Options
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99       -- Set a high fold level to keep them open
vim.opt.foldlevelstart = 99  -- Prevent auto-folding when opening a file
vim.opt.foldtext = ""          -- Keep fold text clean
vim.opt.foldnestmax = 10       -- Adjust max fold nesting if needed
vim.opt.foldcolumn = "0"     -- Don't show a fold column

-- Undo File Options
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

