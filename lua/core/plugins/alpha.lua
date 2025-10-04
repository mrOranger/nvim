return {
    {
        "goolord/alpha-nvim",
        lazy = false,
        enabled = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end,
    }
}
