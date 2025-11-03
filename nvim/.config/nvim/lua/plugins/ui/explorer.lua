return {
  "snacks.nvim",
  opts = {
    explorer = {
      enabled = true,
    },
    picker = {
      layout = {
        preset = "vertical",
      },
      sources = {
        files = {
          layout = {
            preset = "vscode",
          },
        },
        recent = {
          layout = {
            preset = "vscode",
          },
        },
        grep = {
          layout = {
            preset = "vertical",
          },
        },
        lsp_references = {
          layout = {
            preset = "vertical",
          },
        },
        lsp_definitions = {
          layout = {
            preset = "vertical",
          },
        },
        buffers = {
          layout = {
            preset = "vscode",
          },
        },
        git_files = {
          layout = {
            preset = "vscode",
          },
        },
        explorer = {
          layout = {
            preset = "sidebar",
            preview = true,
            layout = {
              position = "right",
              width = 0.4,
            },
          },
        },
      },
    },
  },
}
