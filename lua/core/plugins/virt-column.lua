return {
    {
        "lukas-reineke/virt-column.nvim",
        enabled = true,
        init = function ()
            require('virt-column').setup({
                char = '┃',
                virtcolumn = "120",
                highlight = { "NonText" },
            })
        end,
    }
}
