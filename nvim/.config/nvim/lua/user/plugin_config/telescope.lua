_G.telescope_builtin = require('telescope.builtin')

require('telescope').setup({
        defaults = {
                layout_strategy = "vertical",
                sorting_strategy = "ascending",
                results_title = false,
                dynamic_preview_title = true,
                layout_config = {
                        width = 0.95,
                        height = 0.95,
                        prompt_position = "top",
                        vertical = {
                                mirror = true,
                                preview_height = 0.4
                        }
                },

        }
})
return {}
