-- Load Mason first (package manager for LSP)
require("user.lsp.mason")

-- Load individual LSP configs
require("user.lsp.lua_ls")
require("user.lsp.ts_ls")
require("user.lsp.eslint")
require("user.lsp.angular")

-- LSP Attach Event for Key Mappings
vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
                local opts = {
                        buffer = ev.buf,
                        noremap = true,
                        silent = true
                }
                local function with_desc(desc)
                        return vim.tbl_extend("force", opts, { desc = desc })
                end

                vim.keymap.set('n', '<leader>lg', vim.lsp.buf.definition, with_desc('Go to definition'))
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, with_desc('Show hover documentation'))
                vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, with_desc('Rename symbol'))
                vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, with_desc('Code action'))
                vim.keymap.set('n', '<leader>lu', function()
                        _G.telescope_builtin.lsp_references({
                                layout_strategy = "vertical",
                                layout_config = {
                                        preview_height = 0.7, -- Preview takes 70% of the window height
                                        width = 0.9, -- Window takes 90% of screen width
                                        height = 0.8 -- Window takes 80% of screen height
                                }
                        })
                end, { desc = 'Find references/usages (telescope)' })
        end,
})

return {}
