local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  {
    -- Handle dotnet packages and references
    "JesperLundberg/projektgunnar.nvim",
    dependencies = {
      "echasnovski/mini.pick",
      "echasnovski/mini.notify",
    },
    event = "VeryLazy",
  },

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    enabled = false,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    -- Show all todo comments in solution
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
    event = "VeryLazy",
  },

  {
    -- File manager
    "echasnovski/mini.files",
    version = false,
    config = function()
      require("core.utils").load_mappings "minifiles"
      require("mini.files").setup {
        mappings = {
          go_in_plus = "<Right>",
          go_out_plus = "<Left>",
          synchronize = "<C-s>",
        },
      }
    end,
    event = "VeryLazy",
  },

  {
    -- Move lines and blocks of code
    "echasnovski/mini.move",
    version = false,
    config = function()
      require("mini.move").setup {
        options = {
          reindent_linewise = true,
        },
      }
    end,
    event = "VeryLazy",
  },

  {
    -- Highlight the word under the cursor
    "echasnovski/mini.cursorword",
    version = false,
    config = function()
      require("mini.cursorword").setup {}
    end,
    event = "BufRead",
  },

  {
    "echasnovski/mini.ai",
    version = false,
    config = function()
      require("mini.ai").setup {}
    end,
    event = "BufRead",
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
  },
  opts = {
    {
      ---@type string
      arg = "leetcode.nvim",
  
      ---@type lc.lang
      lang = "python",
  
      cn = { -- leetcode.cn
          enabled = false, ---@type boolean
          translator = true, ---@type boolean
          translate_problems = true, ---@type boolean
      },
  
      ---@type string
      directory = vim.fn.stdpath("data") .. "/leetcode/",
  
      ---@type boolean
      logging = true,
  
      injector = {}, ---@type table<lc.lang, lc.inject>
  
      cache = {
          update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
      },
  
      console = {
          open_on_runcode = true, ---@type boolean
  
          dir = "row", ---@type lc.direction
  
          size = { ---@type lc.size
              width = "90%",
              height = "75%",
          },
  
          result = {
              size = "60%", ---@type lc.size
          },
  
          testcase = {
              virt_text = true, ---@type boolean
  
              size = "40%", ---@type lc.size
          },
      },
  
      description = {
          position = "left", ---@type lc.position
  
          width = "40%", ---@type lc.size
  
          show_stats = true, ---@type boolean
      },
  
      hooks = {
          ---@type fun()[]
          LeetEnter = {},
  
          ---@type fun(question: lc.ui.Question)[]
          LeetQuestionNew = {},
      },
  
      keys = {
          toggle = { "q", "<Esc>" }, ---@type string|string[]
          confirm = { "<CR>" }, ---@type string|string[]
  
          reset_testcases = "r", ---@type string
          use_testcase = "U", ---@type string
          focus_testcases = "H", ---@type string
          focus_result = "L", ---@type string
      },
  
      ---@type boolean
      image_support = false, -- setting this to `true` will disable question description wrap
    }
  },
}

return plugins
