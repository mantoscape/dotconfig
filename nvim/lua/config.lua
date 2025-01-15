-- Set tabs width and always insert spaces instead of actual tabs.
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Fold
-- vim.opt.foldmethod = "indent" -- use treesetter as fold source
vim.opt.foldenable = true
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 4

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.wo.number = true
vim.wo.relativenumber = true
