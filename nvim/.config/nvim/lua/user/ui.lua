-- Set colorscheme
vim.cmd("colorscheme rose-pine")

-- Set transparency
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- Dashboard Configuration (Alpha)
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local ascii = require('ascii')

-- Dashboard Header
dashboard.section.header.val = ascii.get_random("text", "neovim")

-- Dashboard Menu Buttons
dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("t", "  Find text", ":Telescope live_grep<CR>"),
        dashboard.button("c", "  Configuration", ":e ~/.config/nvim/<CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Dashboard Footer
local function footer()
        local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
        return "   " .. datetime
end
dashboard.section.footer.val = footer()

-- Dashboard Styling
dashboard.section.footer.opts.hl = "Constant"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Function"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

-- Auto-start Dashboard
vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
                if vim.fn.argc() == 0 and vim.fn.line2byte('$') == -1 then
                        require('alpha').start()
                end
        end,
})

return {}
