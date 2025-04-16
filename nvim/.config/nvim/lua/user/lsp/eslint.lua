local lspconfig = require('lspconfig')

lspconfig.eslint.setup({
        on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            _G.eslint_then_format(bufnr)
                        end
                })
        end,
})

return {}
