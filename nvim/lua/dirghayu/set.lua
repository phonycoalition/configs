vim.opt.nu = true

--- Enable relative line number
vim.opt.relativenumber = true

--- Enable mouse mode
vim.opt.mouse = 'a'

--- Save undo history
vim.opt.undofile = true

--- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

--- Split configuration
vim.opt.splitright = true
vim.opt.splitbelow = true

--- Show cursor line
vim.opt.cursorline = true

--- Tab configuration
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--- Indentations
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

--- Minimal number of screen lines to keep above and below cursor
vim.opt.scrolloff = 10

-- Decrease update time
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- se system clipboard as default register

vim.api.nvim_create_autocmd("FileType", {
    pattern = "R",
    command = "setlocal shiftwidth=2 tabstop=2"
})
