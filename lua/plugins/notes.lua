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
      function ToggleCheckbox()
        local line = vim.api.nvim_get_current_line()
        if line:find("%[x%]") then
          line = line:gsub("%[x%]", "[ ]", 1)
        else
          line = line:gsub("%[ ]", "[x]", 1)
        end
        vim.api.nvim_set_current_line(line)
      end

      vim.api.nvim_set_keymap('n', '<leader>ot', ':lua ToggleCheckbox()<CR>',
        { noremap = true, silent = true, desc = " Toggle checkbox" })

      require("obsidian").setup({
        workspaces = {
          {
            name = "obsidian",
            path = "~/obsidian",
          },
        },
        ui = {
          enable = true,
          checkboxes = {
            -- [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
            -- ["x"] = { char = "", hl_group = "ObsidianDone" },
            -- ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
            -- ["!"] = { char = "", hl_group = "ObsidianImportant" },
            [' '] = { char = '☐', hl_group = 'ObsidianTodo' },
            ['x'] = { char = '', hl_group = 'ObsidianDone' },
            ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
          },
          hl_groups = {
            ObsidianTodo = { bold = true, fg = "#13ff00" },
            ObsidianDone = { bold = true, fg = "#89ddff" },
            ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
            ObsidianTilde = { bold = true, fg = "#ff5370" },
            ObsidianImportant = { bold = true, fg = "#d73128" },
            ObsidianBullet = { bold = true, fg = "#89ddff" },
            ObsidianRefText = { underline = true, fg = "#c792ea" },
            ObsidianExtLinkIcon = { fg = "#c792ea" },
            ObsidianTag = { italic = true, fg = "#89ddff" },
            ObsidianBlockID = { italic = true, fg = "#89ddff" },
            ObsidianHighlightText = { bg = "#75662e" },
          },
        },
      })
    end,
  },
  -- {
  --   'MeanderingProgrammer/markdown.nvim',
  --   main = "render-markdown",
  --   event = "BufRead",
  --   opts = {},
  --   name = 'render-markdown',                                                            -- Only needed if you have another plugin named markdown.nvim
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you use the mini.nvim suite
  -- },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   event = "BufRead",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   -- ft = { "markdown" },
  --   build = function() vim.fn["mkdp#util#install"]() end,
  -- },
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
