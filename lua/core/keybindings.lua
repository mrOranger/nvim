vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>x", ":q!<CR>", { desc = "Quit current buffer without save" })
vim.keymap.set("n", "<leader>X", ":qa!<CR>", { desc = "Quit all buffers without save"} )
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>W", ":wa!<CR>", { desc = "Force Write" })
vim.keymap.set("n", "<leader>s", ":%s/", { desc = "Find an replace" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to left buffer" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to right buffer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
