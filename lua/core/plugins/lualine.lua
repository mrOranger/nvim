return {
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        enabled = true,
        config = function ()
            require("lualine").setup({
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "diff" },
                    lualine_c = { "filename", "filetype", "encoding", "filesize" },
                    lualine_x = { },
                    lualine_y = { "progress" },
                    lualine_z = { "lsp_status" },
                }
            })
        end,
    }
}
