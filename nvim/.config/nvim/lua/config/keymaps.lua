-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Clear search highlights with Enter
vim.keymap.set("n", "<CR>", ":noh<CR><CR>", { desc = "Clear highlights" })

-- Movement with centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- Config reload
vim.keymap.set(
  "n",
  "<leader>cr",
  ':source ~/.config/nvim/init.lua<CR>:echo "Neovim config reloaded!"<CR>',
  { noremap = true, silent = false, desc = "Reload nvim config" }
)

-- UI

-- Navigation between windows
vim.keymap.set("n", "<leader>w<Left>", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<leader>w<Right>", "<C-w>l", { desc = "Go to the right window" })
vim.keymap.set("n", "<leader>w<Up>", "<C-w>k", { desc = "Go to the window above" })
vim.keymap.set("n", "<leader>w<Down>", "<C-w>j", { desc = "Go to the window below" })

-- Moving windows
vim.keymap.set("n", "<leader>w<S-Left>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<leader>w<S-Right>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<leader>w<S-Up>", "<C-w>K", { desc = "Move window to the top" })
vim.keymap.set("n", "<leader>w<S-Down>", "<C-w>J", { desc = "Move window to the bottom" })

-- Mark navigation and operations
vim.keymap.set("n", "gm", "'", { desc = "Go to mark (line)" })
vim.keymap.set("n", "gM", "`", { desc = "Go to mark (exact position)" })
vim.keymap.set("n", "dm", ":delmarks ", { desc = "Delete mark" })
