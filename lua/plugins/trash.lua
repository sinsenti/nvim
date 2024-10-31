return {
  {
    'MeanderingProgrammer/markdown.nvim',
    main = "render-markdown",
    opts = {},
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you use the mini.nvim suite
  },

  -- {
  --   "mistricky/codesnap.nvim",
  --   build = "make",
  -- },
  -- {
  --   'Exafunction/codeium.vim',
  --   event = "InsertEnter",
  --   config = function ()
  --     -- Change '<C-g>' here to any keycode you like.
  --     vim.keymap.set('i', '<C-e>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
  --     vim.keymap.set('i', '<c-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
  --     vim.keymap.set('i', '<c-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
  --     vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  --   end
  -- },
  {
    "iamcco/markdown-preview.nvim",
    -- cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
  "preservim/vim-pencil",
  },
  -- {
  --   "epwalsh/obsidian.nvim",
  --   version = "*",  -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   ft = "markdown",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  -- },
  {
    'tpope/vim-obsession',
  },

  {
    "tpope/vim-surround",
  },
  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 15; -- Height of the floating window
        border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
        default_mappings = true;
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = { -- Configure the telescope UI for slowing the references cycling window.
          telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
        };
        -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
        focus_on_open = true; -- Focus the floating window when opening it.
        dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
        force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true, -- Whether to nest floating windows
        preview_window_title = { enable = true, position = "left" }, -- Whether 
      }
    end
  },




  'ray-x/go.nvim',
  'ray-x/guihua.lua',
  --TODO

  --TODO
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },
  {
  'theHamsta/nvim-dap-virtual-text',
  },
  {
  'leoluz/nvim-dap-go',
  },

  -- Git related plugins


  {
    "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}
  },
  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  },

  {
    "folke/twilight.nvim",
    -- ft = "markdown",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
