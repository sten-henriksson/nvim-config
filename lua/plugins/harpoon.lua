return {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
        -- Existing keybindings
        { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
        { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
        { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
        { "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },

        -- New keybindings for direct file navigation (1-9)
        { "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon file 1" },
        { "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon file 2" },
        { "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon file 3" },
        { "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon file 4" },
        { "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "Harpoon file 5" },
        { "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "Harpoon file 6" },
        { "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", desc = "Harpoon file 7" },
        { "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", desc = "Harpoon file 8" },
        { "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", desc = "Harpoon file 9" },
    },
}

