return {
  {
    'MeanderingProgrammer/markdown.nvim',
    main = "render-markdown",
    opts = {},
    name = 'render-markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you use the mini.nvim suite
  },
  {
    "iamcco/markdown-preview.nvim",
    -- cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "preservim/vim-pencil",
  },
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
        width = 120, -- Width of the floating window
        height = 15, -- Height of the floating window
        border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
        default_mappings = true,
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = { -- Configure the telescope UI for slowing the references cycling window.
          telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
        },
        -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
        focus_on_open = true,                                        -- Focus the floating window when opening it.
        dismiss_on_move = false,                                     -- Dismiss the floating window when moving the cursor.
        force_close = true,                                          -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "wipe",                                          -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true,                       -- Whether to nest floating windows
        preview_window_title = { enable = true, position = "left" }, -- Whether
      }
    end
  },
  {
    'ray-x/go.nvim'
  },
  {
    'ray-x/guihua.lua'
  },
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
    },
  },
  -- {
  --   "ThePrimeagen/harpoon",
  --   branch = "harpoon2",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     local harpoon = require("harpoon")
  --
  --     harpoon:setup({})
  --
  --     vim.keymap.set("n", "<leader>p", function() harpoon:list():add() end, { desc = "Add to harpoon" })
  --     vim.keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
  --
  --     -- basic telescope configuration
  --     local conf = require("telescope.config").values
  --     local function toggle_telescope(harpoon_files)
  --       local file_paths = {}
  --       for _, item in ipairs(harpoon_files.items) do
  --         table.insert(file_paths, item.value)
  --       end
  --
  --       require("telescope.pickers").new({}, {
  --         prompt_title = "Harpoon",
  --         finder = require("telescope.finders").new_table({
  --           results = file_paths,
  --         }),
  --         previewer = conf.file_previewer({}),
  --         sorter = conf.generic_sorter({}),
  --       }):find()
  --     end
  --
  --     vim.keymap.set("n", "<leader>hh", function() toggle_telescope(harpoon:list()) end,
  --       { desc = "Open harpoon window" })
  --   end
  --
  -- },
  --
  -- "kevinhwang91/nvim-ufo",
  -- dependencies = "kevinhwang91/promise-async",
  -- config = function()
  --   vim.o.foldcolumn = "1" -- '0' is not bad
  --   vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  --   vim.o.foldlevelstart = 99
  --   -- vim.o.foldenable = true
  --
  --   vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
  --   vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
  --   vim.keymap.set("n", "zK", function()
  --     local winid = require("ufo").peekFoldedLinesUnderCursor()
  --     if not winid then
  --       vim.lsp.buf.hover()
  --     end
  --   end, { desc = "Peek Fold" })
  --
  --   require("ufo").setup({
  --     provider_selector = function(bufnr, filetype, buftype)
  --       return { "lsp", "indent" }
  --     end,
  --   })
  -- end,
  --
  -- {
  --   "epwalsh/obsidian.nvim",
  --   version = "*",  -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   ft = "markdown",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  -- },
  -- {
  --   "mistricky/codesnap.nvim",
  --   build = "make",
  -- },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     -- add any opts here
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua",    -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  --   config = function()
  --     require('avante').setup({
  --       api_key = "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",                        -- Replace with your API key
  --       endpoint = "https://api-inference.huggingface.co/models/llama-3.2", -- Replace with your model's endpoint
  --       max_tokens = 512,
  --       temperature = 0.7,
  --       top_p = 0.9,
  --       frequency_penalty = 0.0,
  --       presence_penalty = 0.0,
  --     })
  --   end,
  -- },

}
