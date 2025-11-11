return {
    {
        "akinsho/bufferline.nvim",
        lazy = false,
        enable = true,
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function ()
            require("bufferline").setup({
                options = {
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { "close" },
                    },
                    separator_style = "padded_slant",
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "",
                            highlight = "",
                            separator = true,
                        }
                    },
                    always_show_bufferline = true,
                    auto_toggle_bufferline = true,
                    enforce_regular_tabs = true,
                    themable = true,
                    custom_filter = function(buf_number, buf_numbers)
                        local name = vim.fn.bufname(buf_number)
                        local buftype = vim.bo[buf_number].buftype

                        if name == "" and buftype == "" then
                            if #buf_numbers > 1 then
                                return false
                            end
                        end

                        return true
                    end,
                }
            })

            vim.opt.termguicolors = true

            vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
            vim.keymap.set("n", "<S-Tab>x", ":BufferLineCloseOthers<CR>", { silent = true })
        end,
    }
}
