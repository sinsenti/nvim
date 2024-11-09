local opts = { noremap = true, silent = true }

--
--terminal
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert",
})
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", opts)

function _G.open_split_terminal()
    vim.cmd('vsplit')
    local win = vim.api.nvim_get_current_win()
    -- vim.wo[win].wrap = false  -- Disable line wrapping
    vim.wo[win].number = false
    vim.wo[win].relativenumber = false
    vim.wo[win].cursorline = false  -- Disable cursorline
    vim.wo[win].cursorcolumn = false  -- Disable cursorcolumn
    local command = "ollama run llama3.2"
    vim.cmd('terminal')
    vim.api.nvim_put({command}, 'l', true, true)

end
vim.keymap.set('n', '<leader>wt', ':lua _G.open_split_terminal()<CR>', opts)

function _G.open_floating_terminal()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = 120,
        height = 30,
        col = math.floor((vim.o.columns - 120) / 2),
        row = math.floor((vim.o.lines - 30) / 2),
        style = 'minimal',
        border = 'single',
    })
    vim.cmd("terminal")
end
vim.keymap.set('n','wt',':lua _G.open_floating_terminal()<CR>', opts)
vim.keymap.set('n', '<leader>dd', function()
    vim.cmd('Format')
    vim.cmd('w')
    local path = vim.fn.expand('%:p')
    local file_name = vim.fn.expand('%:t:r')
    path = vim.fn.substitute(path, '\\', '/', 'g')
    -- vim.fn.setreg('+', path)
    -- local clipboard_content = vim.fn.getreg('+')
    local command = "clang++ -o " .. file_name .. " " .. path .. " && ./" ..file_name..
    vim.cmd('lua open_floating_terminal()')
    vim.api.nvim_put({command}, 'l', true, true)
end, opts)



vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", opts)
vim.api.nvim_set_keymap("n", "tj", ":bfirst<CR>", opts)
vim.api.nvim_set_keymap("n", "th", ":bprev<CR>", opts)
vim.api.nvim_set_keymap("n", "tl", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "tk", ":blast<CR>", opts)
vim.api.nvim_set_keymap("n", "td", ":w<CR>:bdelete<CR>", opts)
vim.keymap.set("n", "<leader>e", "<cmd>GoIfErr<cr>", opts)
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>:w<CR>', opts)
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>:w<CR>', opts)
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', opts)


--resize windows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

vim.keymap.set('i', 'jk', '<Esc>', opts)
vim.api.nvim_set_keymap('n', 'QQ', ':q<CR>', opts)
vim.api.nvim_set_keymap('n', 'WW', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', 'TT', ':TransparentToggle<CR>', opts)
vim.api.nvim_set_keymap('n', 'E', '$', { noremap = false })
vim.api.nvim_set_keymap('n', 'B', '^', { noremap = false })

-- Split windows
vim.keymap.set('n', 'ss', ':vsplit<Return>', opts)
vim.keymap.set('n', 'sv', ':split<Return>', opts)

-- Tabs
vim.keymap.set('n', 'te', ':tabedit<CR>', opts)
vim.keymap.set('n', '<tab>', ':tabnext<Return>', opts)
vim.keymap.set('n', '<s-tab>', ':tabprev<Return>', opts)


-- vim.keymap.set('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', { silent = true })
-- vim.keymap.set('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', { silent = true })
-- vim.keymap.set('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', { silent = true })
-- vim.keymap.set('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', { silent = true })
