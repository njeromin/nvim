return {
  -- libs --
  {
    "nvim-lua/plenary.nvim",
    module = "plenary",
  },
  {
    "MunifTanjim/nui.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
    module = "nvim-web-devicons",
  },
  {
    "famiu/bufdelete.nvim",
    module = "bufdelete",
  },
  {
    "stevearc/dressing.nvim",
    config = function () require("plugins.configs.dressing") end,
  },

  -- treesitter --
  {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufRead" },
      { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },
      { "windwp/nvim-ts-autotag", event = "BufRead" },
      { "RRethy/nvim-treesitter-endwise", ft = { "lua", "ruby", "vimscript", "bash", "elixir" } }
    },
    config = function () require("plugins.configs.treesitter") end,
    run = function () require("nvim-treesitter.install").update({ with_sync = true }) end,
  },

  -- mason --
  {
    "williamboman/mason.nvim",
    config = function () require("mason").setup() end,
  },

  -- --- --
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function () require("plugins.configs.neo-tree") end,
    module = "neo-tree",
    cmd = "Neotree",
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function () require("plugins.configs.telescope") end,
    module = "telescope",
    cmd = "Telescope",
  },
  {
    "akinsho/bufferline.nvim",
    config = function () require("plugins.configs.bufferline") end,
  },
  {
    "Pocco81/auto-save.nvim",
    event = { "BufWritePre", "InsertLeavePre" },
    config = function () require("plugins.configs.auto-save") end,
  },
  {
    "utilyre/barbecue.nvim",
    requires = { "smiteshp/nvim-navic" },
    event = "BufRead",
    config = function () require("barbecue").setup() end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function () require("plugins.configs.autopairs") end,
  },
  {
    "gpanders/editorconfig.nvim",
    event = "InsertEnter"
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    config = function () require("plugins.configs.indent-blankline") end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    config = function () require("Comment").setup() end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = function () require("gitsigns").setup() end,
  },
  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
  {
    "folke/trouble.nvim",
    config = function () require("trouble").setup() end,
  },
  {
    "rcarriga/nvim-notify",
    config = function () vim.notify = require("notify") end,
  },
  {
    "ziglang/zig.vim",
  },
}
