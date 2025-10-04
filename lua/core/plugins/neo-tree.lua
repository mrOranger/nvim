return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = false,
        enabled = true,
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function ()
            vim.keymap.set("n", "<C-n>rr", ":Neotree filesystem revel right")
            vim.keymap.set("n", "<C-n>rl", ":Neotree filesystem reveal left")

            require("neo-tree").setup({
                close_if_last_window = false,
                popup_border_style = "",
                enable_git_status = true,
                enable_diagnostics = true,
                open_files_using_relative_paths = true,
                sort_case_insensitive = true,
                default_component_configs = {
                    container = {
                        enable_character_fade = true,
                    },
                    indent = {
                        indent_size = 2,
                        padding = 1,
                        with_markers = true,
                        indent_marker = "|",
                        expander_collapsed = "",
                        expander_expanded = "",
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
                buffers = {
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = true,
                    },
                },
            })
        end,
    }
}
