return {
    {
        "kylechui/nvim-surround",
        lazy = false,
        enabled = true,
        event = "VeryLazy",
        config = function ()
            require("nvim-surround").setup()
        end,
    }
}
