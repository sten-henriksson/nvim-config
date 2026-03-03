require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>tt", ":lua require('base46').toggle_transparency()<CR>", { noremap = true, silent = true, desc = "Toggle Background Transparency" })
map("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy current file path" })
map("n", "<leader>crp", '<cmd>let @+ = expand("%:.")<CR>', { desc = "Copy current file relative path" })

-- Rust Mappings
map("n", "<leader>rr", "<cmd>RustLsp runnables<CR>", { desc = "Rust Runnables" })
map("n", "<leader>rt", "<cmd>RustLsp testables<CR>", { desc = "Rust Testables" })
map("n", "<leader>rd", "<cmd>RustLsp debuggables<CR>", { desc = "Rust Debuggables" })
map("n", "<leader>ra", "<cmd>RustLsp codeAction<CR>", { desc = "Rust Code Action" })
map("n", "<leader>re", "<cmd>RustLsp expandMacro<CR>", { desc = "Rust Expand Macro" })
map("n", "<leader>ro", "<cmd>RustLsp openDocs<CR>", { desc = "Rust Open Docs" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
