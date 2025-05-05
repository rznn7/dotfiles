return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "sonarlint-language-server",
      },
    },
  },

  {
    "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
    opts = {
      server = {
        cmd = {
          "sonarlint-language-server",
          "-stdio",
          "-analyzers",
          vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarjava.jar"),
          vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarjs.jar"),
        },
      },
      filetypes = {
        "typescript",
        "java",
      },
    },
  },
}
