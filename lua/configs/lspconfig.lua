require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls","ruff","ty","tsserver","tailwindcss" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
