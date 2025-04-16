-- Leader key configuration
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic editor options
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 10

-- Enable inlay hints
vim.opt.showmode = true
vim.lsp.inlay_hint.enable(true)

return {}
