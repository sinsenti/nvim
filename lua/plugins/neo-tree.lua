return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup({
      window = {
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
        },
      },
    })
  end,
  vim.keymap.set("n", "<leader>-", ":Neotree toggle left<CR>", { noremap = true, silent = true })
}
