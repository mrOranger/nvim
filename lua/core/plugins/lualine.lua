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
                },
                sections = {
                    lualine_a = { { "mode", icon = '', } },
                    lualine_b = { "diff" },
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
