-- Gutter (line numbers, etc.)
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true

-- Misc. extra characters
vim.o.list = true
-- vim.o.shortmess =

-- indentation
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- don't wrap text
vim.o.wrap = false

-- mouse mode
vim.o.mouse = "a"

-- scroll preservations
vim.o.scrolloff = 3

-- preserve undo history
vim.o.undofile = true

-- / command behaviors
vim.o.ignorecase = true
vim.o.smartcase = true

-- new split behaviors
vim.o.splitright = true
vim.o.splitbelow = true

-- confirm on exit
vim.o.confirm = true

-- preview substitutions live
vim.o.inccommand = "split"

-- use the system clipboard as the vim clipboard
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)
