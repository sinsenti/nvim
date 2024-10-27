
return {
  "stevearc/oil.nvim",
  config = function()
    local actions = require('oil.actions')

    require('oil').setup({
      preview = {
        always_show = true
      },
      keymaps = {
        ['h'] = actions.parent,
        ['l'] = actions.select,
        ['-']= actions.delete,
      },
      actions={
        delete={ confirm=false},
        create={confirm=false},
      },
    }) 

    vim.keymap.set("n", "<leader>e", require('oil').toggle_float, {})
  end,
}

