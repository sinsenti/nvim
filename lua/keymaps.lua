local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", opts)
-- buffers


vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert", -- Automatically enter insert mode in the terminal
})
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", opts)
function _G.open_floating_terminal()
    local buf = vim.api.nvim_create_buf(false, true) -- Create a new empty buffer
    vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = 120,         -- Set the width of the floating terminal
        height = 30,         -- Set the height of the floating terminal
        col = math.floor((vim.o.columns - 120) / 2), -- Center the window horizontally
        row = math.floor((vim.o.lines - 30) / 2),    -- Center the window vertically
        style = 'minimal',   -- Use a minimal theme for the buffer
        border = 'single',     -- Make the border transparent
        -- background = '#f0f0f0' -- Set the background color to white
    })
    vim.cmd("terminal")
end

vim.api.nvim_set_keymap("n", "<leader>wt", "<cmd>lua open_floating_terminal()<CR>", opts)
vim.keymap.set('n', 'wt', ':w<CR>:vsplit<CR>:terminal<CR>', opts)


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
