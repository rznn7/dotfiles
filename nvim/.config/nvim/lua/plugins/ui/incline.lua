return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  enabled = true,
  config = function()
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = "#c9c7cd", guifg = "#27272a" },
          InclineNormalNC = { guibg = "#27272a", guifg = "#c9c7cd" },
        },
      },
      window = { margin = { vertical = 0, horizontal = 1 } },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local icon = require("nvim-web-devicons").get_icon(filename)
        return { { icon, guifg = "#27272a" }, { " " }, { filename } }
      end,
    })
  end,
}
