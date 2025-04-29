local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- Core plugins
Plug 'nvim-lua/plenary.nvim' -- Lua functions library, required by many plugins
Plug 'folke/which-key.nvim'  -- Displays keybindings in popup
Plug 'mbbill/undotree'       -- Visualize undo history

-- UI and Aesthetics
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' }) -- Catppuccin color scheme
Plug('rose-pine/neovim', { ['as'] = 'rose-pine' }) -- Rose Pine color scheme
Plug 'goolord/alpha-nvim'                          -- Greeter/dashboard
Plug 'MaximilianLloyd/ascii.nvim'                  -- ASCII art for dashboard
Plug 'nvim-lualine/lualine.nvim'                   -- Status line
Plug 'nvim-tree/nvim-web-devicons'                 -- File icons
Plug 'norcalli/nvim-colorizer.lua'                 -- Colorize hex
Plug 'j-hui/fidget.nvim'


-- File navigation and management
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.8' }) -- Fuzzy finder
Plug 'nvim-tree/nvim-tree.lua'                           -- File explorer

-- Language support and syntax
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' }) -- Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter-context'

-- LSP (Language Server Protocol)
Plug 'neovim/nvim-lspconfig'             -- LSP configuration
Plug 'williamboman/mason.nvim'           -- Package manager for LSP servers
Plug 'williamboman/mason-lspconfig.nvim' -- Bridge between mason and lspconfig
Plug 'stevearc/conform.nvim'             -- Formatter
Plug 'ThePrimeagen/refactoring.nvim'     -- Refactoring utilities

-- Completion and snippets
Plug 'hrsh7th/nvim-cmp'         -- Completion engine
Plug 'hrsh7th/cmp-nvim-lsp'     -- LSP completion source
Plug 'hrsh7th/cmp-buffer'       -- Buffer completion source
Plug 'hrsh7th/cmp-path'         -- Path completion source
Plug 'L3MON4D3/LuaSnip'         -- Snippet engine
Plug 'saadparwaiz1/cmp_luasnip' -- Snippet source for nvim-cmp

-- Git integration
Plug 'kdheepak/lazygit.nvim'  -- Git commands and UI
Plug 'sindrets/diffview.nvim' -- Git diff viewer
Plug 'FabijanZulj/blame.nvim' -- Git blame
vim.call('plug#end')

return {}
