-- search case insensitive
vim.opt.ignorecase = true

-- search case-sensitive if expression contains a capital letter
vim.opt.smartcase = true

-- line numbers
vim.opt.number = true

vim.opt.title = true

-- <TAB> settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.foldmethod = "indent"
-- disable fold at start
vim.opt.foldenable = false

-- " useful status information at bottom of screen
-- " (maybe not used because of vim-airline)
-- set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ L%l,%c-%v\ %)%P

-- damn there's no plus equal +=
vim.opt.diffopt = vim.opt.diffopt + "vertical"

-- we'll see, primeagen tip
vim.opt.updatetime = 50
