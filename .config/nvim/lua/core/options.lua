-- Settings
vim.opt.number = true

-- indent
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- swap dir
vim.opt.directory = vim.fn.stdpath('data') .. '/tmp'
vim.opt.backupdir = vim.fn.stdpath('data') .. '/tmp'
vim.opt.shada = "'50,<50,f1,:50,/50,h"
vim.opt.shadafile = vim.fn.stdpath('state') .. '/shada/main.shada'

-- mouse, clipboard
vim.opt.mouse = 'a'
vim.opt.clipboard:append{'unnamedplus'}

-- keymap
vim.keymap.set('i', '<C-c>', '<ESC>')
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], {silent = true})

-- don't check close buffer
vim.opt.hidden = true

-- screen split derection
vim.opt.splitright = true
vim.opt.splitbelow = true

-- sign colunm
vim.opt.signcolumn = "yes"
-- replace preview
vim.opt.inccommand = 'split'

-- disable linenumber for terminal mode
vim.api.nvim_create_autocmd({"TermOpen"},{
  pattern = {"*"},
  command = "setlocal nonumber norelativenumber"
})

-- file encoding
vim.opt.fileencodings = "utf-8,iso-2022-jp,euc-jp,sjis"

-- CursorHold time
vim.opt.updatetime = 200

-- Visible space
vim.opt.list = true
vim.opt.listchars = {trail = "·", tab = "──"}
