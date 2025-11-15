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
                }
            })

            vim.opt.termguicolors = true


            local function close_buffer(save)
                local current_buf = vim.api.nvim_get_current_buf()
                local buffers = vim.fn.getbufinfo({buflisted = 1})

                if save and vim.bo.modified and vim.api.nvim_buf_get_name(current_buf) ~= '' then
                    vim.cmd('write')
                end

                if #buffers <= 1 then
                    vim.cmd('enew')
                    if save then
                        vim.cmd('bdelete ' .. current_buf)
                    else
                        vim.cmd('bdelete! ' .. current_buf)
                    end
                else
                    vim.cmd('bprevious')
                    if save then
                        vim.cmd('bdelete ' .. current_buf)
                    else
                        vim.cmd('bdelete! ' .. current_buf)
                    end
                end
            end


            local function close_all_buffers(save)
                local buffers = vim.fn.getbufinfo({buflisted = 1})

                if save then
                    for _, buf in ipairs(buffers) do
                        local bufnr = buf.bufnr
                        local modified = vim.api.nvim_buf_get_option(bufnr, 'modified')
                        local bufname = vim.api.nvim_buf_get_name(bufnr)

                        if modified and bufname ~= '' then
                            vim.api.nvim_buf_call(bufnr, function()
                                vim.cmd('write')
                            end)
                        end
                    end
                end

                for _, buf in ipairs(buffers) do
                    if save then
                        vim.cmd('bdelete ' .. buf.bufnr)
                    else
                        vim.cmd('bdelete! ' .. buf.bufnr)
                    end
                end

                vim.cmd('enew')
            end

            vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
            vim.keymap.set('n', '<leader>x', function() close_buffer(false) end, { silent = true })
            vim.keymap.set('n', '<leader>wx', function() close_buffer(true) end, { silent = true })
            vim.keymap.set('n', '<leader>X', function() close_all_buffers(false) end, { silent = true })
            vim.keymap.set('n', '<leader>WX', function() close_all_buffers(true) end, { silent = true })
        end,
    }
}
