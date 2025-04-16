require 'mason'.setup()
require 'mason-lspconfig'.setup {
        ensure_installed = { "lua_ls", "ts_ls", "eslint", "angularls" },
        automatic_installation = true,
}

return {}
