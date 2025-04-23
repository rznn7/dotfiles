-- General Mappings
vim.keymap.set('n', '<leader>r', ':source ~/.config/nvim/init.lua<CR>:echo "Neovim config reloaded!"<CR>',
        { noremap = true, silent = false, desc = "Reload nvim config" })
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, desc = "Save" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, desc = "Quit" })
vim.keymap.set('n', '<leader>e', ':Explore<CR>', { noremap = true, desc = "File explorer" })
vim.keymap.set('n', '<CR>', ':noh<CR><CR>', { desc = 'Erase highlights' })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')

-- Telescope Mappings (using the global variable from telescope config)
vim.keymap.set('n', '<leader>ff', function() _G.telescope_builtin.find_files() end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', function() _G.telescope_builtin.live_grep() end, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', function() _G.telescope_builtin.buffers() end, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', function() _G.telescope_builtin.help_tags() end, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fr', function() _G.telescope_builtin.oldfiles() end, { desc = 'Telescope old files' })

-- Dashboard Mappings
vim.keymap.set('n', '<leader>d', ':Alpha<CR>', { noremap = true, desc = "Open dashboard" })

-- Lazygit Mappings
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, desc = "Open Lazygit" })

-- Diffview Mappings
vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', { noremap = true, desc = "Open Diffview" })
vim.keymap.set('n', '<leader>gD', ':DiffviewClose<CR>', { noremap = true, desc = "Close Diffview" })
vim.keymap.set('n', '<leader>gh', ':DiffviewFileHistory<CR>', { noremap = true, desc = "Diffview file history" })
vim.keymap.set('n', '<leader>gf', ':DiffviewFileHistory %<CR>',
        { noremap = true, desc = "Diffview current file history" })

-- NvimTree Mappings
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<leader>tf', ':NvimTreeFindFile<CR>', { desc = 'Find file in NvimTree' })

-- Diagnostic Mappings
-- Show diagnostics in a floating window (keep existing)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
vim.keymap.set('n', '<leader>lD', function()
        _G.telescope_builtin.diagnostics()
end, { desc = 'List all diagnostics' })
vim.keymap.set('n', '<leader>lb', function()
        _G.telescope_builtin.diagnostics({
                bufnr = 0,
                layout_strategy = "vertical",
                layout_config = {
                        preview_height = 0.7, -- Preview takes 50% of the window
                        width = 0.9,          -- Window takes 90% of screen width
                        height = 0.8          -- Window takes 60% of screen height
                }
        })
end, { desc = 'List buffer diagnostics (horizontal)' })


-- Formatting Mappings
vim.keymap.set('n', '<leader>lf', function()
        require("conform").format({ lsp_fallback = true })
end, { desc = 'Format with default formatter' })

vim.keymap.set('n', '<leader>lp', function()
        require("conform").format({
                formatters = { "prettier" }
        })
end, { desc = 'Format with Prettier' })

-- Global fallback for ESLint manual fix
vim.keymap.set('n', '<leader>ll', function()
        local eslint_client = false
        for _, client in pairs(vim.lsp.get_active_clients()) do
                if client.name == "eslint" then
                        eslint_client = true
                        break
                end
        end

        if eslint_client then
                vim.cmd('EslintFixAll')
        else
                vim.notify("ESLint LSP not attached to this buffer", vim.log.levels.WARN)
        end
end, { desc = 'Run ESLint fix' })

-- LSP mappings
local function setup_lsp_keymaps(bufnr)
        local opts = {
                buffer = bufnr,
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
        vim.keymap.set('n', '<leader>lu', function() _G.telescope_builtin.lsp_references() end,
                with_desc(('Find usages')))
end

return {
        setup_lsp_keymaps = setup_lsp_keymaps
}
