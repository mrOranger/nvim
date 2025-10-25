return {
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = false,
        enabled = true,
        config = function ()
            require("ibl").setup()
        end
    }
}
