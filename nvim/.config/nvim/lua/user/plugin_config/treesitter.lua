require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
                "lua",
                "typescript",
                "javascript",
                "java",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline"
        },
        sync_install = false,
        auto_install = false,
        highlight = {
                enable = true,
        },
}

return {}
