return {
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        -- keys={
        --   "<leader>:",
        --   function()
        -- require('notify').dismiss({silent=true, pendint=true})
        --   end,
        --   desc='Dismiss All Notifications',
        -- },
        background_colour = "#000000",
        enabled = false,
      })
    end
  },

  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        routes = {
          {
            filter = {
              event = 'msg_show',
              any = {
                { find = '%d+L, %d+B' },
                { find = '; after #%d+' },
                { find = '; before #%d+' },
                { find = '%d fewer lines' },
                { find = '%d more lines' },
              },
            },
            opts = { skip = true },
          }
        },
      })
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
}
