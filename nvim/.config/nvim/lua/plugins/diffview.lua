return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
  keys = {
    { "<leader>gl", "<cmd>DiffviewFileHistory<cr>", desc = "Git log (repo)" },
    { "<leader>gL", "<cmd>DiffviewFileHistory %<cr>", desc = "Git log (file)" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
  },
}
