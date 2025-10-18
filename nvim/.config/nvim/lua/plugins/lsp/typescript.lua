return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        settings = {
          typescript = {
            inlayHints = {
              functionLikeReturnTypes = { enabled = true },
              variableTypes = { enabled = true },
            },
          },
        },
      },
    },
  },
}
