return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      open_mapping = [[<leader>q]],
      direction = 'vertical',
      size = function(term)
        if term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        elseif term.direction == "horizontal" then
          return 15
        end
        return 20
      end,
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true,
      -- Add this line:
      insert_mappings = false, -- Prevent mappings from taking effect in insert mode
      shade_terminals = false,
    },
  }
}
