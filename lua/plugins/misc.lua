return {
  {
      'ThePrimeagen/git-worktree.nvim',
    config=function()
  require('git-worktree').setup()
    end,

  },
  {
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines 
    event = { "BufRead", "BufNewFile" },
    config=function()
  require('Comment').setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },
}
