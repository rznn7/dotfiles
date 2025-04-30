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

-- Add any other keymaps from your original config here
-- Note: LazyVim already sets up many keymaps, check its default keymaps first
