return {
  "stevearc/oil.nvim",
  config = function()
    local actions = require('oil.actions')

    require('oil').setup({
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      float = {
        padding = 13,
      },
      preview = {
        always_show = true
      },
      keymaps = {
        ['h'] = actions.parent,
        ['l'] = actions.select,
        ['-'] = false,
        ["gt"] = "actions.toggle_trash",
      },
      actions = {
        delete = { confirm = false },
        create = { confirm = false },
      },
    })

    vim.keymap.set("n", "-", require('oil').toggle_float, {})
  end,
}
