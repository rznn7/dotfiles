return {
  "snacks.nvim",
  opts = {
    explorer = {
      enabled = true,
    },
    picker = {
      layout = {
        preset = "ivy_split",
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
