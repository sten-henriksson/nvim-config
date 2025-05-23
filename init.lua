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
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set('n', 'gf', function()
      local file = vim.fn.expand('<cfile>')
      if file == '' then
        return
      end
      
      -- Resolve relative paths based on current file's directory
      local current_file_dir = vim.fn.expand('%:p:h')
      local target_file = file
      
      -- Handle relative paths
      if file:match('^%./') or file:match('^%.%./')
         or not file:match('^/') then
        -- It's a relative path, resolve it relative to the current file
        target_file = vim.fn.simplify(current_file_dir .. '/' .. file)
      end
      
      -- Check if the file exists
      local exists = vim.fn.filereadable(target_file) == 1
      
      if exists then
        -- If the file exists, use the normal gf behavior
        vim.cmd('normal! gf')
      else
        -- Create necessary directories if they don't exist
        local target_dir = vim.fn.fnamemodify(target_file, ':h')
        if vim.fn.isdirectory(target_dir) == 0 then
          vim.fn.mkdir(target_dir, 'p')
        end
        
        -- Edit the file (creating it if needed)
        vim.cmd('edit ' .. vim.fn.fnameescape(target_file))
      end
    end, { buffer = true, noremap = true, silent = true })
  end,
})

vim.schedule(function()
  require "mappings"
end)
