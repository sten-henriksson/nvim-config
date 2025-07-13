-- This file needs to have same structure as nvconfig.lua-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  -- Try using a standard NvChad theme name for Tokyonight's dark variant.
  -- "tokyonight_night" is often used, or simply "tokyonight" if it defaults to a dark style.
  -- Please verify the exact theme name from NvChad's documentation or its theme files if this doesn't work.
  theme = "tokyodark", -- Changed from "tokyodark"

  palette_override = {
    -- Overriding base00 and bg attempts to change the theme's fundamental colors.
    -- This can be effective if the theme name is correct and it uses these keys for its main background.
    --- base00 = "#000000",
    --bg = "#000000",
  },

  hl_override = {
    -- This is the most direct way to force the editor's background to black.
    -- Normal = { bg = "#000000" },

    -- To ensure a consistent black background, you might want to target other common UI elements.
    -- Uncomment and adjust as needed. Make sure foreground colors provide enough contrast.
    -- NormalFloat = { bg = "#000000" }, -- Background for floating windows
    -- FloatBorder = { bg = "#000000" }, -- Usually colored, making it black might look odd
    --WinSeparator = { bg = "#000000", fg = "#222222" }, -- Separators between windows (fg set to dark grey for subtle visibility)
    -- SignColumn = { bg = "#000000" }, -- Gutter for linters, git signs, etc.
    --FoldColumn = { bg = "#000000" }, -- Gutter for code folds
    --LineNr = { bg = "#000000", fg = "#505050" }, -- Line number background (fg set to a visible grey)
    -- ColorColumn = { bg = "#000000" }, -- if you use 'colorcolumn'

    -- Previous user settings for comments (can be kept if desired)
    -- Comment = { italic = true },
    -- ["@comment"] = { italic = true },
  },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
--    enabled=false
  }
}

return M


local vim = vim
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

