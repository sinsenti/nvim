return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
      },


      -- with buffer in upper part
      sections = {
        lualine_x = {
          {
            require('noice').api.statusline.mode.get,
            cond = require('noice').api.statusline.mode.has,
            color = { fg = '#ff9e64' },
          },
          {
            require('noice').api.status.command.get,
            cond = require('noice').api.status.command.has,
            color = { fg = '#ff9e64' },
          },
        },
      },
      tabline = {
        lualine_a = { 'tabs' },
        lualine_b = {
          {
            'buffers',
            mode = 0,
            show_filename_only = true,
            icons_enabled=false
          },
        },
      }
    })



    -- Example: To go to tab 5, type 't5'
    -- sections = {
    --   lualine_x = {
    --     {
    --       require('noice').api.statusline.mode.get,
    --       cond = require('noice').api.statusline.mode.has,
    --       color = { fg = '#ff9e64' },
    --     },
    --     {
    --       require('noice').api.status.command.get,
    --       cond = require('noice').api.status.command.has,
    --       color = { fg = '#ff9e64' },
    --     },
    --   },
    --   lualine_a = {
    --     {
    --       'buffers',
    --     }
    --   }
    -- }
  end
}
