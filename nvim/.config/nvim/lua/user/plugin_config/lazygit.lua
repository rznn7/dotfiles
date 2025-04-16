-- LazyGit setup
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_border_chars = { '', '', '', '', '', '', '', '' } -- customize lazygit popup window border characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = {
        vim.fn.expand('$HOME') .. '/config/lazygit/config.yml',
}


function EditLineFromLazygit(file_path, line)
        local path = vim.fn.expand("%:p")

        if path == file_path then
                vim.cmd(tostring(line))
        else
                vim.cmd("e " .. file_path)
                vim.cmd(tostring(line))
        end
end

function EditFromLazygit(file_path)
        local path = vim.fn.expand("%:p")

        if path == file_path then
                return
        else
                vim.cmd("e " .. file_path)
        end
end

return {}
