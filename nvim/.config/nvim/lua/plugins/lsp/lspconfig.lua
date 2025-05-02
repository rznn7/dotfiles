return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        settings = {
          typescript = {
            inlayHints = {
              functionLikeReturnTypes = { enabled = false },
            },
          },
        },
      },
    },
  },
}
