-- lua/plugins/toggleterm.lua (or wherever you define your plugins)
return {
  {
    'akinsho/toggleterm.nvim',
    version = "*", -- You can specify a git tag here e.g., "v2.13.1" or keep "*" for latest
    opts = {
      -- Keybinding to toggle the terminal
      open_mapping = [[<leader>q]],

      -- Direction of the terminal split
      -- 'vertical' will open it as a vertical split.
      -- By default, new vertical splits open to the right.
      direction = 'vertical',

      -- Optional: Set the size of the vertical split.
      -- This can be a number (columns) or a function.
      -- Example: 40% of the screen width
      size = function(term)
        if term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        elseif term.direction == "horizontal" then
          return 15 -- Default or your preferred size for horizontal
        end
        -- Add other directions if you use them (e.g., float, tab)
        return 20 -- A fallback default size
      end,

      -- Start in insert mode
      start_in_insert = true,

      -- Persist the size of the terminal window
      persist_size = true,

      -- Close the terminal window when the process exits
      close_on_exit = true,

      -- You can add other toggleterm options here as needed:
      -- shell = vim.o.shell, -- Use Neovim's default shell

      -- To make the terminal background transparent or match your editor better,
      -- you might want to adjust highlights:
      highlights = {
        Normal = {
          -- guibg = "NONE", -- For a transparent background if your terminal supports it
          -- Or link to your editor's Normal background
          link = "Normal"
        },
        -- NormalFloat = {
        --   link = 'Normal' -- If you use floating terminals
        -- },
        -- FloatBorder = {
        --   guifg = "FloatBorder", -- Link to existing highlight group
        --   guibg = "Normal"       -- Or your preferred background
        -- },
      },
      -- If you define Normal highlights, you might want to disable default shading
      shade_terminals = false,
    },
    -- config = true, -- Not strictly necessary if 'opts' is used,
                     -- as lazy.nvim will pass opts to the setup function.
                     -- However, it doesn't hurt to leave it if you had it.
  }
}
