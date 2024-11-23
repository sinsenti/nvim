return {


  {
    "epwalsh/obsidian.nvim",
    version = "*",
    -- lazy = true,
    -- ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "obsidian",
            path = "~/obsidian",
          },
        },
      })
    end,
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    main = "render-markdown",
    event = "BufRead",
    opts = {},
    name = 'render-markdown',                                                            -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you use the mini.nvim suite
  },
  {
    "iamcco/markdown-preview.nvim",
    event = "BufRead",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  -- {
  --   "mistricky/codesnap.nvim",
  --   lazy=true;
  --   build = "make",
  --   config = function()
  --     require("codesnap").setup({
  --       border = "rounded",
  --       has_breadcrumbs = true,
  --       bg_theme = "grape",
  --       watermark = ""
  --     })
  --   end,
  -- },
  -- {
  --   "mistricky/codesnap.nvim",
  --   lazy='true',
  --   build='make',
  --   cmd= "CodeSnapPreviewOn",
  --   config=function(_, opts)
  --     require("codesnap").setup(opts)
  --   end
  -- },
}
