-- Settings
vim.opt.number = true

-- indent
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.list = true

-- swap dir
vim.opt.directory = vim.fn.stdpath('data') .. '/tmp'
vim.opt.backupdir = vim.fn.stdpath('data') .. '/tmp'
vim.opt.viminfo = ''

-- mouse, clipboard
vim.opt.mouse = 'a'
vim.opt.clipboard:append{'unnamedplus'}

-- keymap
vim.keymap.set('i', '<C-c>', '<ESC>')
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], {silent = true})

-- buffer
vim.opt.hidden = true
