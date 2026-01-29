return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      highlight_groups = {
        LspInlayHint = { fg = "highlight_high", bg = "base" },
      },
    })
    vim.cmd("colorscheme rose-pine")
  end,
}
