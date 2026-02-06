#!/bin/bash
set -e

echo "Starting Neovim environment setup..."

# 1. Ensure Local Bin exists and is in PATH
mkdir -p "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"

# 2. Install ripgrep (v14.1.0)
if ! command -v rg &> /dev/null; then
    echo "Installing ripgrep..."
    RG_VERSION="14.1.0"
    curl -LO "https://github.com/BurntSushi/ripgrep/releases/download/${RG_VERSION}/ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
    tar xzvf "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
    mv "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl/rg" "$HOME/.local/bin/"
    chmod +x "$HOME/.local/bin/rg"
    rm -rf "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl"*
    echo "ripgrep installed."
else
    echo "ripgrep is already installed."
fi

# 3. Verify Node.js/npm (Required for many Mason LSPs)
if ! command -v npm &> /dev/null; then
    echo "Error: npm is not installed. Please install Node.js and npm first."
    exit 1
fi

# 4. Install Mason LSP Servers
if command -v nvim &> /dev/null; then
    echo "Installing LSP servers via Mason..."
    # Installs: HTML, CSS, Python (pyright), ESLint, Tailwind, TypeScript, Lua
    nvim --headless -c "MasonInstall html-lsp css-lsp pyright eslint-lsp tailwindcss-language-server typescript-language-server lua-language-server" -c "q"
    echo "Mason installation complete."
else
    echo "Error: Neovim (nvim) is not found in PATH. Please install Neovim first."
    exit 1
fi

echo "Setup finished successfully! Restart Neovim to apply changes."
