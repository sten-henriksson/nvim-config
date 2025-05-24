-- lua/plugins/lazygit.lua
return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration (if you want it)
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- If you want a nicer border for the floating window, you might add
        -- a UI plugin here, though plenary is the direct dependency for lazygit.nvim itself.
        -- For example, if you use nvim-telescope/telescope.nvim or dressing.nvim for UI elements elsewhere
        -- and want consistent borders, you might consider those.
        -- However, for basic functionality, only plenary.nvim is listed as a direct dependency.
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        -- You can add more keybindings related to lazygit here if needed
        -- e.g., { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Current File" }
    }
}
