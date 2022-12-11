return {
  -- libs --
  {
    "nvim-lua/plenary.nvim",
    module = "plenary",
  },
  {
    "MunifTanjim/nui.nvim",
    module = "nui",
  },
  {
    "nvim-tree/nvim-web-devicons",
    module = "nvim-web-devicons",
  },
  {
    "famiu/bufdelete.nvim",
    module = "bufdelete",
  },
  
  -- treesitter --
  {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufRead" },
      { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },
      { "windwp/nvim-ts-autotag", event = "BufRead" },
    },
    config = function () require("plugins.configs.treesitter") end,
    run = function () require("nvim-treesitter.install").update({ with_sync = true }) end,
  },

  -- mason --
  { 
    "williamboman/mason.nvim",
    requires = {
      { "williamboman/mason-lspconfig.nvim", disable = not core.enabled_features["lsp"] },
    },
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
    "catppuccin/nvim",
    as = "catppuccin",
    config = function ()
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd.colorscheme("catppuccin")
    end,
  }
}
