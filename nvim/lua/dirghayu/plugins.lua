require("lazy").setup({
    { -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },
        config = function()
            require('telescope').setup {
                defaults = {
                    path_display = { "smart" },
                },
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                },
            }

            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')

        end,
    },
    "rebelot/kanagawa.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag",
        }
    },
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x'
    },
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    {
        'nvim-tree/nvim-tree.lua',
        version = "*",
        lazy = false,
        config = function()
            require("nvim-tree").setup {}
        end,
        dependencies = {
            {
                "JMarkin/nvim-tree.lua-float-preview",
                lazy = true,
                -- default
                opts = {
                    -- Whether the float preview is enabled by default. When set to false, it has to be "toggled" on.
                    toggled_on = true,
                    -- wrap nvimtree commands
                    wrap_nvimtree_commands = true,
                    -- lines for scroll
                    scroll_lines = 20,
                    -- window config
                    window = {
                        style = "minimal",
                        relative = "win",
                        border = "rounded",
                        wrap = false,
                    },
                    mapping = {
                        -- scroll down float buffer
                        down = { "<C-d>" },
                        -- scroll up float buffer
                        up = { "<C-e>", "<C-u>" },
                        -- enable/disable float windows
                        toggle = { "<C-x>" },
                    },
                    -- hooks if return false preview doesn't shown
                    hooks = {
                        pre_open = function(path)
                            -- if file > 5 MB or not text -> not preview
                            local size = require("float-preview.utils").get_size(path)
                            if type(size) ~= "number" then
                                return false
                            end
                            local is_text = require("float-preview.utils").is_text(path)
                            return size < 5 and is_text
                        end,
                        post_open = function(bufnr)
                            return true
                        end,
                    },
                },
            },
        },
    },
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        opts = {}
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    'JuliaEditorSupport/julia-vim',
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },
    {
        'nvim-orgmode/orgmode',
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter', lazy = true },
        },
        event = 'VeryLazy',
        config = function()
            -- Setup treesitter
            require('nvim-treesitter.configs').setup({
                highlight = {
                    enable = true,
                },
                ensure_installed = { 'org' },
            })

            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })
        end,
    },
    'akinsho/org-bullets.nvim',
    'kaarmu/typst.vim',
    'levouh/tint.nvim',
    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({--[[ your config ]]})
        end,
    }
})
