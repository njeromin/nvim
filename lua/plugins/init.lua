local opts = _G.config.options or {}
local ts_opts = opts.treesitter or {}

local M = {}

M.rocks = {
	["toml"] = {},
}

M.nvim = {
  ["lewis6991/impatient.nvim"] = {},
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },
  ["kevinhwang91/promise-async"] = {},
  ["romgrk/fzy-lua-native"] = {},
  ["kyazdani42/nvim-web-devicons"] = {},
  ["antoinemadec/FixCursorHold.nvim"] = {
    config = function () vim.g.cursorhold_updatetime = 100 end,
  },

  ["RRethy/nvim-base16"] = {
    config = SafeRequire("theme"),
  },

  ["rcarriga/nvim-notify"] = {
    config = function () vim.notify = require("notify") end,
  },

  ["williamboman/mason.nvim"] = {
    config = require("utils").requirePluginConfig("mason", function (cfg) cfg.mason() end),
  },
  ["williamboman/mason-lspconfig.nvim"] = {
    config = require("utils").requirePluginConfig("mason", function (cfg) cfg.mason_lspconfig() end),
  },

  -- treesitter
  ["nvim-treesitter/nvim-treesitter"] = {
    disable = not ts_opts.enable,
    config = require("utils").requirePluginConfig("treesitter"),
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
  ["folke/lua-dev.nvim"] = {},
  ["onsails/lspkind.nvim"] = {},
  ["neovim/nvim-lspconfig"] = {
    requires = {
      "lua-dev.nvim",
    },
    config = require("utils").requirePluginConfig("lsp")
  },
  ["j-hui/fidget.nvim"] = {
    config = require("utils").requirePluginConfig("fidget"),
  },

  -- completion
  ["hrsh7th/cmp-nvim-lsp"] = {},
  ["hrsh7th/cmp-buffer"] = {},
  ["hrsh7th/cmp-path"] = {},
  ["hrsh7th/cmp-cmdline"] = {},
  ["rafamadriz/friendly-snippets"] = {
    module = "cmp_nvim_lsp",
    event = "InsertEnter",
  },
  ["hrsh7th/nvim-cmp"] = {
    config = require("utils").requirePluginConfig("lsp.completion"),
  },
  ["L3MON4D3/LuaSnip"] = {
    config = require("utils").requirePluginConfig("lsp.luasnip"),
  },

  ["kevinhwang91/nvim-ufo"] = {
    config = require("utils").requirePluginConfig("ufo"),
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    config = require("utils").requirePluginConfig("indent-blankline"),
  },
  ["lewis6991/gitsigns.nvim"] = {
    config = function () require("gitsigns").setup() end,
  },
  ["kyazdani42/nvim-tree.lua"] = {
    config = require("utils").requirePluginConfig("nvim-tree"),
  },
  ["nvim-telescope/telescope.nvim"] = {
    config = require("utils").requirePluginConfig("telescope"),
  },
  ["Pocco81/auto-save.nvim"] = {
    disable = not opts.autosave,
    config = function () require("auto-save").setup() end,
  },
  ["folke/which-key.nvim"] = {
    config = require("utils").requirePluginConfig("whichkey"),
  },
}

return M
