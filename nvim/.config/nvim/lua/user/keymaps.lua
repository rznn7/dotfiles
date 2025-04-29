------------------------------
-- Core Editor Mappings (No Prefix)
------------------------------

-- Essential operations
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, desc = "Save" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, desc = "Quit" })
vim.keymap.set('n', '<leader>Q', ':qa!<CR>', { noremap = true, desc = "Force quit all" })
vim.keymap.set('n', '<leader>/', ':noh<CR>', { noremap = true, desc = "Clear search highlights" })
vim.keymap.set('n', '<CR>', ':noh<CR><CR>', { desc = 'Clear highlights' })

-- Movement with centering (keep existing)
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')

-- Config reload
vim.keymap.set('n', '<leader>cr', ':source ~/.config/nvim/init.lua<CR>:echo "Neovim config reloaded!"<CR>',
    { noremap = true, silent = false, desc = "Reload nvim config" })

------------------------------
-- Files & Navigation (<leader>f)
------------------------------

-- File operations
vim.keymap.set('n', '<leader>fn', ':enew<CR>', { noremap = true, desc = "New file" })
vim.keymap.set('n', '<leader>fe', ':Explore<CR>', { noremap = true, desc = "File explorer (netrw)" })

-- Telescope file operations
vim.keymap.set('n', '<leader>ff', function() _G.telescope_builtin.find_files() end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fr', function() _G.telescope_builtin.oldfiles() end, { desc = 'Recent files' })
vim.keymap.set('n', '<leader>fg', function() _G.telescope_builtin.live_grep() end, { desc = 'Find text (grep)' })
vim.keymap.set('n', '<leader>fb', function() _G.telescope_builtin.buffers() end, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', function() _G.telescope_builtin.help_tags() end, { desc = 'Find help' })
vim.keymap.set('n', '<leader>fs',
    function() _G.telescope_builtin.lsp_document_symbols({ symbols = { 'method', 'constructor' } }) end,
    { desc = 'Find symbols' })

-- NvimTree file browser
vim.keymap.set('n', '<leader>ft', ':NvimTreeToggle<CR>', { desc = 'File tree toggle' })
vim.keymap.set('n', '<leader>fF', ':NvimTreeFindFile<CR>', { desc = 'Find current file in tree' })

------------------------------
-- Git Operations (<leader>g)
------------------------------

-- Lazygit
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, desc = "Open Lazygit" })

-- Diffview
vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', { noremap = true, desc = "Diff view open" })
vim.keymap.set('n', '<leader>gD', ':DiffviewClose<CR>', { noremap = true, desc = "Diff view close" })
vim.keymap.set('n', '<leader>gh', ':DiffviewFileHistory<CR>', { noremap = true, desc = "Diff file history" })
vim.keymap.set('n', '<leader>gf', ':DiffviewFileHistory %<CR>', { noremap = true, desc = "Diff current file history" })

-- Git blame
vim.keymap.set('n', '<leader>gb', ':BlameToggle<CR>', { noremap = true, desc = "Toggle blame" })

------------------------------
-- Code & LSP (<leader>c)
------------------------------

-- LSP navigation
vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>cu', function()
    _G.telescope_builtin.lsp_references({
        show_line = false
    })
end, { desc = 'Find usages' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover documentation' })

-- Diagnostics
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Show diagnostics at cursor' })
vim.keymap.set('n', '<leader>cD', function()
    _G.telescope_builtin.diagnostics()
end, { desc = 'List all diagnostics' })
vim.keymap.set('n', '<leader>cb', function()
    _G.telescope_builtin.diagnostics({
        bufnr = 0,
        layout_strategy = "vertical",
        layout_config = {
            preview_height = 0.7,
            width = 0.9,
            height = 0.8
        }
    })
end, { desc = 'List buffer diagnostics' })

-- Angular specific
vim.keymap.set('n', '<leader>ct', ':lua vim.lsp.buf.type_definition()<CR>', { desc = 'Type definition' })

-- Formatting
vim.keymap.set('n', '<leader>cf', function()
    require("conform").format({ lsp_fallback = true })
end, { desc = 'Format with default formatter' })

vim.keymap.set('n', '<leader>cp', function()
    require("conform").format({
        formatters = { "prettier" }
    })
end, { desc = 'Format with Prettier' })

vim.keymap.set('n', '<leader>ce', function()
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
end, { desc = 'ESLint fix' })

-- Refactoring
vim.keymap.set({ "n", "x" }, "<leader>cr", function() require('telescope').extensions.refactoring.refactors() end,
    { desc = "Refactoring options" })

------------------------------
-- UI & Window Management (<leader>u)
------------------------------

-- Dashboard
vim.keymap.set('n', '<leader>ud', ':Alpha<CR>', { noremap = true, desc = "Open dashboard" })

-- Window splits
vim.keymap.set('n', '<leader>uh', ':split<CR>', { noremap = true, desc = "Horizontal split" })
vim.keymap.set('n', '<leader>uv', ':vsplit<CR>', { noremap = true, desc = "Vertical split" })

-- Colemak-friendly window navigation (avoiding hjkl)
vim.keymap.set('n', '<leader>up', '<C-w>w', { noremap = true, desc = "Go to previous window" })
vim.keymap.set('n', '<leader>un', '<C-w>W', { noremap = true, desc = "Go to next window" })
vim.keymap.set('n', '<leader>u1', '<C-w>1w', { noremap = true, desc = "Go to window 1" })
vim.keymap.set('n', '<leader>u2', '<C-w>2w', { noremap = true, desc = "Go to window 2" })
vim.keymap.set('n', '<leader>u3', '<C-w>3w', { noremap = true, desc = "Go to window 3" })
vim.keymap.set('n', '<leader>u4', '<C-w>4w', { noremap = true, desc = "Go to window 4" })
vim.keymap.set('n', '<leader>ux', '<C-w>x', { noremap = true, desc = "Swap with next window" })

-- Window sizing (with less reliance on symbols that might be hard to reach on Colemak)
vim.keymap.set('n', '<leader>u=', '<C-w>=', { noremap = true, desc = "Equalize windows" })
vim.keymap.set('n', '<leader>uH', ':resize +5<CR>', { noremap = true, desc = "Increase window height" })
vim.keymap.set('n', '<leader>uL', ':resize -5<CR>', { noremap = true, desc = "Decrease window height" })
vim.keymap.set('n', '<leader>uW', ':vertical resize +5<CR>', { noremap = true, desc = "Increase window width" })
vim.keymap.set('n', '<leader>uN', ':vertical resize -5<CR>', { noremap = true, desc = "Decrease window width" })

-- LSP keymaps setup function (called from LSP attach event)
local function setup_lsp_keymaps(bufnr)
    local opts = {
        buffer = bufnr,
        noremap = true,
        silent = true
    }
    local function with_desc(desc)
        return vim.tbl_extend("force", opts, { desc = desc })
    end

    -- These buffer-local mappings will have the same keys
    -- as the global ones defined above for consistency
    vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, with_desc('Go to definition'))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, with_desc('Show hover documentation'))
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, with_desc('Rename symbol'))
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, with_desc('Code action'))
    vim.keymap.set('n', '<leader>cu', function()
            _G.telescope_builtin.lsp_references({
                show_line = false
            })
        end,
        with_desc(('Find usages')))
end

return {
    setup_lsp_keymaps = setup_lsp_keymaps
}
