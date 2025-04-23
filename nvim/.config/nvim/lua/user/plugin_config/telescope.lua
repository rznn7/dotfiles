-- Global variable for access in keymaps
_G.telescope_builtin = require('telescope.builtin')

require('telescope').setup({
        defaults = {
                layout_config = {
                        width = 0.95,
                        height = 0.95,
                },
        }
})
return {}
