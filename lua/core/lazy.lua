local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, lazy_path })
    if (vim.v.shell_error ~= 0) then 
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim: \n"},
            { out, "WarningMsg" },
            { "\nPress any key to exit ..."},
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazy_path)

require("lazy").setup({
    {
        "kylechui/nvim-surround",
        config = function ()
            require("nvim-surround").setup()
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function ()
            require("gitsigns").setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 250,
                },
            })
        end,
    },
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function ()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                    icons_enabled = true,
                }
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        disable_in_macro = true,
        disable_in_visualblock = true,
        disable_in_replace_mode = true,
        enable_bracket_in_quote = true,
    },
    {
        "rebelot/kanagawa.nvim",
        disabled = false,
        config = function ()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "catppuccin/nvim",
        disabled = true,
        config = function ()
            -- vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function ()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                auto_install = true,
                sync_install = true,
                highlight = { enabled = true, },
                indent = { enabled = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        disabled = false,
                        keymaps = {
                            ["fo"] = { query = "@function.outer", desc = "Select outer part of a function" },
                            ["fi"] = { query = "@function.inner", desc = "Select inner part of a function" },
                            ["co"] = { query = "@class.outer", desc = "Select outer part of a class" },
                            ["ci"] = { query = "@class.inner", desc = "Select inner part of a class" },
                        },
                        include_surrounding_whitespace = true,
                    },
                },
            })
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function ()
            vim.keymap.set("n", "<C-n>rr", ":Neotree filesystem revel right")
            vim.keymap.set("n", "<C-n>rl", ":Neotree filesystem reveal left")

            require("neo-tree").setup({
                close_if_last_window = false,
                popup_border_style = "NC",
                enable_git_status = true,
                default_component_configs = {
                    indent = {
                        indent_size = 2,
                        padding = 1,
                        with_markers = true,
                        indent_marker = "|",
                    },
                },
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_ignored = false,
                    },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            local builtin = require('telescope.builtin')

            vim.keymap.set("n", "<C-t>ff", builtin.find_files)
            vim.keymap.set("n", "<C-t>lg", builtin.live_grep)
            vim.keymap.set("n", "<C-t>c", builtin.colorscheme)
            vim.keymap.set("n", "<C-t>gc", builtin.git_commits)
            vim.keymap.set("n", "<C-t>gb", builtin.git_branches)
            vim.keymap.set("n", "<C-t>sd", builtin.diagnostics)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        config = function ()
            require("mason").setup({})
            require("mason-lspconfig").setup()

            vim.diagnostic.config({
                virtual_text = true,
                virtual_line = true,
            })
        end,
    },
    {
       "saghen/blink.cmp",
       dependencies = { "rafamadriz/friendly-snippets" },
       version = "1.x",
       opts = {
           keyamp = { present = "super-tab" },
           appearance = { nerd_font_variant = "mono" },
           completion = { documentation = { auto_show = true } },
           fuzzy = { implementation = "prefer_rust_with_warning" },
           sources = {
               default = { "lsp", "path", "snippets", "buffer" },
               providers = {
                   lazydev = {
                       name = "LazyDev",
                       module = "lazydev.integrations.blink",
                       score_offset = 100,
                   },
               },
           },
       },
       opts_extend = { "sources.default" },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" }}
            },
        },
    },
})
