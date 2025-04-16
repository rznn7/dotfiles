-- Manual ESLint fix command
vim.api.nvim_create_user_command('EslintFix', function()
        vim.cmd('EslintFixAll')
end, {})

-- Manual Prettier format command
vim.api.nvim_create_user_command('Format', function()
        require("conform").format({ lsp_fallback = false })
end, {})

return {}
