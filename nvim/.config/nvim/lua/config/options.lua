-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Basic editor options
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 10
vim.opt.relativenumber = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable inlay hints
vim.lsp.inlay_hint.enable(true)

-- Shell
vim.o.shell = "zsh"

-- LSP Server to use for Rust.
-- Set to "bacon-ls" to use bacon-ls instead of rust-analyzer.
-- only for diagnostics. The rest of LSP support will still be
-- provided by rust-analyzer.
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

-- Enable this option to avoid conflicts with Prettier.
vim.g.lazyvim_prettier_needs_config = true
