local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
        settings = {
                Lua = {
                        hint = {
                                enable = true,
                        },
                        diagnostics = {
                                -- Recognize vim global
                                globals = { 'vim' }
                        }
                }
        }
})

return {}
