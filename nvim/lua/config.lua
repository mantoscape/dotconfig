-- Set line number (relative)
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tabs width and always insert spaces instead of actual tabs.
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Do smart autoindenting when starting a new line. Works for C-like programs, but can also be used for other languages.
vim.opt.smartindent = true

-- Do not wrap text
vim.opt.wrap = false

-- Save history to file
vim.opt.undofile = true
vim.opt.swapfile = false

-- Enables 24-bit RGB color in the terminal ui. Requires an ISO-8613-3 compatible terminal.
vim.opt.termguicolors = true

-- Set minimal number of screen lines to keep above and below the cursor when scrolling.
vim.opt.scrolloff = 8

-- Fixed enabled signcolumn
vim.opt.signcolumn = "yes"

-- Add ruler column
vim.opt.colorcolumn = "120"

-- Set <space> as mapleader. Make sure this line is called before plugins are setup by lazy, so that mappings
-- are correct.
vim.g.mapleader = " "

vim.g.background = "light"

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

-- Highlight all matches while searching, but without keeping them  highlighted when search is finished. The option
-- 'vim.opt.hlsearch' is enabled when starting to search and disabled when leaving.
local incsearch_highlight_augroup = vim.api.nvim_create_augroup("incsearch_highlight", {})
vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
  group = incsearch_highlight_augroup,
  pattern = "/,?",
  command = ":set hlsearch",
})
vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
  group = incsearch_highlight_augroup,
  pattern = "/,?",
  command = ":set nohlsearch",
})

-- Update diagnostics symbols displayed next to line numbers
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- create a "lazy_install" autocommands group to group plugin management autocommands
local lazy_augroup = vim.api.nvim_create_augroup("lazy_install", {})

-- this autocommand will install plugins when any plugin configuration changes. When
-- a change in the configuration of lazy is detected, LazyReload event will be fired.
vim.api.nvim_create_autocmd({ "User" }, {
  group = lazy_augroup,
  pattern = "LazyReload",
  callback = function()
    vim.cmd.source()
    local lazy = require("lazy")
    lazy.clean({ wait = true })
    lazy.install({ wait = true })
  end,
})
