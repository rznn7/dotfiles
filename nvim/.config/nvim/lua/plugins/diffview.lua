return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
  keys = {
    { "<leader>gl", "<cmd>DiffviewFileHistory<cr>", desc = "Git log (repo)" },
    { "<leader>gL", "<cmd>DiffviewFileHistory %<cr>", desc = "Git log (file)" },
    { "<leader>gr", "<cmd>DiffviewOpen<cr>", desc = "Git review (working tree)" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
  },
}
