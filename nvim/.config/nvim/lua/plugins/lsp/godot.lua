local gdproject = io.open(vim.fn.getcwd() .. "/project.godot", "r")
if gdproject then
  io.close(gdproject)
  vim.fn.serverstart("./godothost")
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gdscript = {
        settings = {
          gdscript = {
            format = {
              enable = true,
            },
          },
        },
      },
    },
  },
}
