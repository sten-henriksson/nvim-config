require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "eslint", "tailwindcss" }
vim.lsp.enable "ts_ls"
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
