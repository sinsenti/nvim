local opts = { noremap = true, silent = true }



-- vim.keymap.set('n', 'g[', "ll:lua vim.fn.search('[')<CR>", { noremap = true, silent = true, desc = 'Find square Bracket' })
vim.keymap.set('n', 'g[', function()
    vim.api.nvim_command('normal! 2l')
    vim.fn.search('[')
end, { noremap = true, silent = true, desc = 'Find square Bracket' })
vim.keymap.set('n', 'gl', ":lua vim.fn.search('(')<CR>", { noremap = true, silent = true, desc = 'Find  Bracket' })
-- vim.keymap.set('n', 'gL', function()
--     vim.cmd("lua vim.fn.search(')')")
-- end, { noremap = true, silent = true, desc = 'Find  Bracket' })

-- vim.keymap.set('n', 'gl', function()
--     vim.fn.search('[')
--     local current_line = vim.fn.getline('.') -- Get the content of the current line
--     local search_pattern = '%('              -- The pattern you're looking for, escape '('
--     local start_pos, end_pos = string.find(current_line, search_pattern)
--
--     if start_pos then
--         vim.fn.cursor(vim.fn.line('.'), start_pos)
--         print("Pattern '(' found at: " .. start_pos .. " to " .. end_pos)
--     else
--         print("Pattern '(' not found")
--     end
-- end, { noremap = true, silent = true, desc = 'Find square Bracket' })


vim.api.nvim_create_user_command('DeleteFile', function()
    vim.cmd('w')
    local file = vim.fn.expand('%:p')
    if vim.fn.filereadable(file) == 1 then
        vim.fn.delete(file)
        print('Deleted file: ' .. file)
    else
        print('File does not exist: ' .. file)
    end
    vim.cmd('bdelete')
end, { desc = 'Delete the current file and buffer' })

vim.keymap.set('n', '<leader>od', ':DeleteFile', {})
vim.keymap.set('n', '<leader>df', ':DeleteFile', {})

--neogit
vim.keymap.set('n', '<leader>gs', ':Neogit<CR>', { silent = true, noremap = true, desc = 'Open neogit' })
vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ga', ':Git add .<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>gg', ':Git ', { desc = 'Git' })
vim.keymap.set('n', '<leader>ee', '<cmd>GoIfErr<cr>', { silent = true, noremap = true })


vim.api.nvim_set_keymap('n', '<leader>gg', ':Git ', { desc = 'Git ' })
vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '*',
    command = 'startinsert',
})

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n>', opts)

function _G.open_split_terminal()
    vim.cmd('vsplit')
    local win = vim.api.nvim_get_current_win()
    -- vim.wo[win].wrap = false  -- Disable line wrapping
    vim.wo[win].number = false
    vim.wo[win].relativenumber = false
    -- vim.wo[win].cursorline = false   -- Disable cursorline
    vim.wo[win].cursorcolumn = false -- Disable cursorcolumn
    local command = 'ollama run llama3.2'
    vim.cmd('terminal')
    vim.api.nvim_put({ command }, 'l', true, true)
end

vim.keymap.set('n', '<leader>wt', ':lua _G.open_split_terminal()<CR>', opts)

function _G.open_floating_terminal()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = 120,
        height = 30,
        col = math.floor((vim.o.columns - 120) / 2),
        row = math.floor((vim.o.lines - 30) / 2),
        style = 'minimal',
        border = 'single',
    })
    vim.cmd('terminal')
end

vim.keymap.set('n', 'wt', ':lua _G.open_floating_terminal()<CR>', opts)
vim.keymap.set('n', '<leader>dd', function()
    vim.cmd('Format')
    vim.cmd('w')
    local path = vim.fn.expand('%:p')
    local file_name = vim.fn.expand('%:t:r')
    path = vim.fn.substitute(path, '\\', '/', 'g')
    -- vim.fn.setreg('+', path)
    -- local clipboard_content = vim.fn.getreg('+')
    local command = 'clang++ -o ' .. file_name .. ' ' .. path .. ' && ./' .. file_name ..
        vim.cmd('lua open_floating_terminal()')
    vim.api.nvim_put({ command }, 'l', true, true)
end, opts)



vim.keymap.set('n', '<leader>mk', ':mksession!<CR>', { noremap = true, silent = true, desc = 'Create Session' })
vim.keymap.set('n', '<leader>mt', ':source Session.vim<CR>', { noremap = true, silent = true, desc = 'Open Session' })

vim.api.nvim_set_keymap('n', 'tw', ':Twilight<enter>', opts)
vim.api.nvim_set_keymap('n', 'tj', ':bfirst<CR>', opts)
vim.api.nvim_set_keymap('n', 'th', ':bprev<CR>', opts)
vim.api.nvim_set_keymap('n', 'tl', ':bnext<CR>', opts)
vim.api.nvim_set_keymap('n', 'tk', ':blast<CR>', opts)
-- vim.api.nvim_set_keymap('n', 'td', ':w<CR>:bdelete<CR>', opts)

function _G.save_and_delete_buffer()
    if vim.api.nvim_buf_get_name(0) == '' then
        vim.cmd('bdelete')
    else
        vim.cmd('w')
        vim.cmd('bdelete')
    end
end

-- Set the key mapping
vim.api.nvim_set_keymap('n', 'td', ':lua save_and_delete_buffer()<CR>', opts)




vim.keymap.set('n', '<leader>e', '<cmd>GoIfErr<cr>', opts)
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>:w<CR>', opts)
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>:w<CR>', opts)
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', opts)


--resize windows
vim.api.nvim_set_keymap('n', '<C-W>,', ':vertical resize -10<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-W>.', ':vertical resize +10<CR>', { noremap = true })
-- vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
-- vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
-- vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
-- vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)
--
vim.keymap.set('n', '<Esc>', ':noh<CR>:NoiceDismiss<CR>', opts)

vim.keymap.set('i', 'jk', '<Esc>', opts)
vim.keymap.set('i', 'Jk', '<Esc>', opts)
vim.keymap.set('i', 'JK', '<Esc>', opts)
vim.api.nvim_set_keymap('n', 'QQ', ':q<CR>', opts)
vim.api.nvim_set_keymap('n', 'WW', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', 'WQ', ':wqa<CR>', opts)
vim.api.nvim_set_keymap('n', '<c-s>', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', 'TT', ':TransparentToggle<CR>', opts)
vim.api.nvim_set_keymap('n', 'E', '$', opts)
vim.api.nvim_set_keymap('n', 'B', '^', opts)

-- Split windows
vim.keymap.set('n', 'ss', ':vsplit<Return>', opts)
vim.keymap.set('n', 'sv', ':split<Return>', opts)

-- Tabs
vim.keymap.set('n', 'te', ':tabedit<CR>', opts)
vim.keymap.set('n', '<tab>', ':tabnext<Return>', opts)
vim.keymap.set('n', '<s-tab>', ':tabprev<Return>', opts)
