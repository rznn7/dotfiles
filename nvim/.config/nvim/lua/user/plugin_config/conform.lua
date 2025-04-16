require("conform").setup({
        formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
        },
        format_on_save = {
                -- Disabled because triggered manually after ESLint
                lsp_fallback = false,
                timeout_ms = 500,
        },
})

-- Helper function for ESLint + Prettier workflow (used in LSP config)
_G.eslint_then_format = function(bufnr)
        -- Run ESLint fix
        vim.cmd("EslintFixAll")

        -- Then run Prettier via conform.nvim
        require("conform").format({ bufnr = bufnr, lsp_fallback = false })
end

return {}
