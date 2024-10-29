return {
  {
    'nvim-telescope/telescope-ui-select.nvim',
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require('telescope.actions')
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = { '%.git', '%.mypy_cache', '.git', '.venv' },
          layout_config = {
            preview_width = 0.65,
            horizontal = {
              size = {
                width = '95%',
                height = '95%',
              },
            },
          },
          mappings = {
            i = {
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
            },
            n = {
              ['q'] = actions.close,
            },
          },
          pickers = {
            find_files = {
              hidden = true,
            },
            buffers = {
              initial_mode = 'normal',
              mappings = {
                n = {
                  ['d'] = actions.delete_buffer,
                },
              },
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({})
          },
        },
      })

      local builtin = require('telescope.builtin')
      local keymap = vim.keymap.set
      keymap('n', '<leader>ff', builtin.find_files, {})
      keymap('n', '<leader>fg', builtin.live_grep, {})
      keymap('n', '<leader>fb', builtin.buffers, {})
      keymap('n', '<leader><leader>', builtin.oldfiles, {})

      require('telescope').load_extension('ui-select')
    end,
  },
}
