local opts = { noremap = true, silent = true }


-- keymap.set('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', { silent = true })
-- keymap.set('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', { silent = true })
-- keymap.set('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', { silent = true })
-- keymap.set('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', { silent = true })
-- then delete this
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', opts)


--resize windows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts) --clear highlights

vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

--my keymap
vim.keymap.set('i', 'jk', '<Esc>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', 'TT', ':TransparentToggle<CR>', opts)
vim.api.nvim_set_keymap('n', 'E', '$', { noremap = false })
vim.api.nvim_set_keymap('n', 'B', '^', { noremap = false })

-- Split windows
vim.keymap.set('n', 'ss', ':vsplit<Return>', opts)
vim.keymap.set('n', 'sv', ':split<Return>', opts)
vim.keymap.set('n', 'wt', ':w<CR>:split<CR>:terminal<CR>i', opts)

-- Tabs
vim.keymap.set('n', 'te', ':tabedit<CR>', opts)
vim.keymap.set('n', '<tab>', ':tabnext<Return>', opts)
vim.keymap.set('n', '<s-tab>', ':tabprev<Return>', opts)



--keymap.del({ 'n', 'i', 'v' }, '<A-j>')
--keymap.del({ 'n', 'i', 'v' }, '<A-k>')
--keymap.del('n', '<C-Left>')
--keymap.del('n', '<C-Down>')
--keymap.del('n', '<C-Up>')
--keymap.del('n', '<C-Right>')
