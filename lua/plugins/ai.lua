return {
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  },
 --  {
 -- "David-Kunz/gen.nvim",
 --  config=function()
 --    require('gen').prompts['DevOps me!'] = {
 --      prompt = "You are a senior devops engineer, acting as an assistant. You offer help with cloud technologies like: Terraform, AWS, kubernetes, c++, python. You answer with code examples when possible. $input:\n$text",
 --      replace = true
 --    }
 --  end,
 --  },
}

