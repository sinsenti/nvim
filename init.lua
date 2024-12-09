local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- local autosave_enabled = true
--
-- vim.api.nvim_create_user_command('AutosaveToggle', function()
--   autosave_enabled = not autosave_enabled
--   if autosave_enabled then
--     print('Autosave enabled')
--   else
--     print('Autosave disabled')
--   end
-- end, {})
--
-- vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged'}, {
--   pattern = '*',
--   callback = function()
--     if autosave_enabled and vim.bo.modified then
--       vim.cmd('silent! write')
--     end
--   end,
-- })




require('options')
require('my_function')
require('keymaps')
require('misc')
require('lazy').setup('plugins')
