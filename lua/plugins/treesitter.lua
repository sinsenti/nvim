return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {
          'bash',
          'lua',
          'python',
          'cpp',
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
