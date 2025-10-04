return {
    {
        "ThePrimeagen/harpoon",
        lazy = false,
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            local harpoon = require("harpoon").setup()

            vim.keymap.set("n", "<C-h>a", function () harpoon:list():add() end)
            vim.keymap.set("n", "<C-h>d", function () harpoon:list():remove() end)
            vim.keymap.set("n", "<C-h>m", function () harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        end,
    }
}
