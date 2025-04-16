local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

lspconfig.angularls.setup({
        root_dir = util.root_pattern('angular.json', 'project.json'),
        on_attach = function(client, bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                print("Angular LSP connected!")

                local opts = { buffer = bufnr, noremap = true, silent = true }
                vim.keymap.set('n', '<leader>at', ':lua vim.lsp.buf.type_definition()<CR>',
                        vim.tbl_extend("force", opts, { desc = 'Angular type definition' }))
        end,
        settings = {
                angular = {
                        completions = {
                                enableDetailedCompletion = true
                        },
                        inlayHints = {
                                parameterNames = true,
                        },
                        suggest = {
                                fromTripleSlashReference = true,
                        },
                        experimental = {
                                enableTemplateTypeChecker = true
                        }
                }
        },
})

return {}
