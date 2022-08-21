local opts = require("user.config") or {}
local ts_opts = opts.treesitter or {}

local requirePluginConfig = require("utils").requirePluginConfig

local M = {}

M.rocks = {}

M.nvim = {
  ["lewis6991/impatient.nvim"] = {},
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },
  ["kevinhwang91/promise-async"] = {},
  ["romgrk/fzy-lua-native"] = {},
  ["kyazdani42/nvim-web-devicons"] = {},
  ["antoinemadec/FixCursorHold.nvim"] = {
    config = function () vim.g.cursorhold_updatetime = 100 end,
  },
  ["stevearc/dressing.nvim"] = {
    config = requirePluginConfig("dressing"),
  },

  ["RRethy/nvim-base16"] = {
    config = SafeRequire("theme"),
  },

  ["rcarriga/nvim-notify"] = {
    config = function () vim.notify = require("notify") end,
  },

  ["williamboman/mason.nvim"] = {
    config = requirePluginConfig("mason", function (cfg) cfg.mason() end),
  },
  ["williamboman/mason-lspconfig.nvim"] = {
    config = requirePluginConfig("mason", function (cfg) cfg.mason_lspconfig() end),
  },

  -- treesitter
  ["nvim-treesitter/nvim-treesitter"] = {
    disable = not ts_opts.enable,
    config = requirePluginConfig("treesitter"),
    run = function () require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    disable = not ts_opts.textobjects,
  },
  ["p00f/nvim-ts-rainbow"] = {
    disable = not ts_opts.rainbow_pairs,
  },
  ["lewis6991/spellsitter.nvim"] = {
    disable = not ts_opts.spellsitter,
    config = function () require("spellsitter").setup() end,
  },

  -- lsp
  ["b0o/SchemaStore.nvim"] = {},
  ["stevearc/vim-arduino"] = {},
  ["folke/lua-dev.nvim"] = {},
  ["simrat39/rust-tools.nvim"] = {},
  ["ray-x/go.nvim"] = {},
  ["onsails/lspkind.nvim"] = {},
  ["neovim/nvim-lspconfig"] = {
    wants = {
      "mason-lspconfig.nvim",
      "SchemaStore.nvim",
      "vim-arduino",
      "rust-tools.nvim",
      "go.nvim",
      "lua-dev.nvim",
      "lspkind.nvim",
    },
    config = requirePluginConfig("lsp")
  },
  ["j-hui/fidget.nvim"] = {
    config = requirePluginConfig("fidget"),
  },

  -- completion
  ["hrsh7th/cmp-nvim-lsp"] = {
    event = "InsertEnter",
  },
  ["hrsh7th/cmp-buffer"] = {
    event = "InsertEnter",
  },
  ["hrsh7th/cmp-path"] = {
    event = "InsertEnter",
  },
  ["hrsh7th/cmp-cmdline"] = {
    event = "InsertEnter",
  },
  ["rafamadriz/friendly-snippets"] = {
    module = "cmp_nvim_lsp",
    event = "InsertEnter",
  },
  ["hrsh7th/nvim-cmp"] = {
    after = { "cmp-nvim-lsp", "cmp-buffer", "cmp-path", "cmp-cmdline" },
    config = requirePluginConfig("lsp.completion"),
  },
  ["L3MON4D3/LuaSnip"] = {
    wants = "friendly-snippets",
    config = requirePluginConfig("lsp.luasnip"),
  },

  -- formatting and linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = requirePluginConfig("lsp.null"),
  },
  ["gpanders/editorconfig.nvim"] = {
    event = "BufRead",
  },

  ["folke/trouble.nvim"] = {
    config = requirePluginConfig("trouble"),
  },
  ["NvChad/nvim-colorizer.lua"] = {
    event = { "BufRead", "BufNewFile" },
    config = function () require("colorizer").setup() end,
  },
  ["kevinhwang91/nvim-ufo"] = {
    config = requirePluginConfig("ufo"),
  },
  ["Darazaki/indent-o-matic"] = {
    config = requirePluginConfig("indent-o-matic"),
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    event = "BufRead",
    config = requirePluginConfig("indent-blankline"),
  },
  ["akinsho/bufferline.nvim"] = {
    config = requirePluginConfig("bufferline"),
  },
  ["lewis6991/gitsigns.nvim"] = {
    event = "BufEnter",
    config = function () require("gitsigns").setup() end,
  },
  ["kyazdani42/nvim-tree.lua"] = {
    config = requirePluginConfig("nvim-tree"),
  },
  ["nvim-telescope/telescope.nvim"] = {
    config = requirePluginConfig("telescope"),
  },
  ["Pocco81/auto-save.nvim"] = {
    disable = not opts.autosave,
    config = requirePluginConfig("autosave"),
  },
  ["folke/which-key.nvim"] = {
    config = requirePluginConfig("whichkey"),
  },
  ["akinsho/toggleterm.nvim"] = {
    config = requirePluginConfig("toggleterm"),
  },
  ["feline-nvim/feline.nvim"] = {
    config = requirePluginConfig("feline"),
  },
  ["numToStr/Comment.nvim"] = {
    event = "BufRead",
    config = function () require("Comment").setup() end,
  },
  ["luukvbaal/stabilize.nvim"] = {
    config = function () require("stabilize").setup() end,
  },
}

return M
