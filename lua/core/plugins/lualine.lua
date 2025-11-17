return {
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        enabled = true,
        config = function ()
            require("lualine").setup({
                options = {
                    globalstatus = true,
                    disabled_filetypes = {
                        statusline = { "neo-tree" }
                    },
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = { 
                        { 
                            "mode", 
                            icon = '',
                            separator = { right = '' }
                        },
                    },
                    lualine_b = { "branch", "diff" },
                    lualine_c = { 
                        {
                            "filename",
                            path = 1,
                        },
                        "filetype",
                        "encoding",
                        "filesize"
                    },
                    lualine_x = { },
                    lualine_y = { "location", "progress" },
                    lualine_z = { "lsp_status" },
                }
            })
        end,
    }
}
