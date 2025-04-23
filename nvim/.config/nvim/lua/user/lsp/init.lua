-- Load Mason first (package manager for LSP)
require("user.lsp.mason")

-- Load individual LSP configs
require("user.lsp.lua_ls")
require("user.lsp.ts_ls")
require("user.lsp.eslint")
require("user.lsp.angular")

local keymaps = require("user.keymaps")

-- LSP Attach Event for Key Mappings
vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
keymaps.setup_lsp_keymaps(ev.buf)
        end,
})

return {}
