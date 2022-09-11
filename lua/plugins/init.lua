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
  ["MunifTanjim/nui.nvim"] = {},
  ["antoinemadec/FixCursorHold.nvim"] = {
    config = function () vim.g.cursorhold_updatetime = 100 end,
  },
  ["stevearc/dressing.nvim"] = {
    config = requirePluginConfig("dressing"),
  },

  ["themercorp/themer.lua"] = {
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
  ["windwp/nvim-ts-autotag"] = {
    disable = not ts_opts.html_autotag,
    config = function () require("nvim-ts-autotag").setup() end,
  },
  ["lewis6991/spellsitter.nvim"] = {
    disable = not ts_opts.spellsitter,
    config = function () require("spellsitter").setup() end,
  },
  ["m-demare/hlargs.nvim"] = {
    disable = not ts_opts.highlight_arguments,
    config = requirePluginConfig("hlargs"),
  },

  -- lsp
  ["b0o/SchemaStore.nvim"] = {},
  ["stevearc/vim-arduino"] = {},
  ["folke/lua-dev.nvim"] = {},
  ["simrat39/rust-tools.nvim"] = {},
  ["Saecki/crates.nvim"] = {
    event = { "BufRead Cargo.toml"},
    config = requirePluginConfig("crates"),
  },
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
  ["kosayoda/nvim-lightbulb"] = {
    config = requirePluginConfig("lightbulb"),
  },
  ["smjonas/inc-rename.nvim"] = {
    config = requirePluginConfig("inc-rename"),
  },

  -- completion
  ["hrsh7th/cmp-nvim-lsp"] = {},
  ["hrsh7th/cmp-buffer"] = {},
  ["hrsh7th/cmp-path"] = {},
  ["hrsh7th/cmp-cmdline"] = {},
  ["David-Kunz/cmp-npm"] = {},
  ["tzachar/cmp-tabnine"] = {
    run = "./install.sh",
  },
  ["rafamadriz/friendly-snippets"] = {
    module = "cmp_nvim_lsp",
  },
  ["hrsh7th/nvim-cmp"] = {
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
    disabled = true,
    event = { "BufRead", "BufNewFile" },
    config = function () require ("colorizer").setup() end,
  },
  ["kevinhwang91/nvim-ufo"] = {
    config = requirePluginConfig("ufo"),
  },
  ["feline-nvim/feline.nvim"] = {
    config = requirePluginConfig("statusline"),
  },
  ["Darazaki/indent-o-matic"] = {
    event = "BufReadPost",
    config = requirePluginConfig("indent-o-matic"),
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    --event = "BufRead",
    config = requirePluginConfig("indent-blankline"),
  },
  ["akinsho/bufferline.nvim"] = {
    config = requirePluginConfig("bufferline"),
  },
  ["lewis6991/gitsigns.nvim"] = {
    event = "BufEnter",
    config = function () require("gitsigns").setup() end,
  },
  ["nvim-neo-tree/neo-tree.nvim"] = {
    config = requirePluginConfig("neo-tree"),
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
  ["numToStr/Comment.nvim"] = {
    event = "BufRead",
    config = function () require("Comment").setup() end,
  },
  ["luukvbaal/stabilize.nvim"] = {
    config = function () require("stabilize").setup() end,
  },
  ["windwp/nvim-autopairs"] = {
    config = requirePluginConfig("autopairs"),
  },
  ["ziontee113/icon-picker.nvim"] = {
    config = function () require("icon-picker").setup({ disable_legacy_commands = true }) end
  },
  ["goolord/alpha-nvim"] = {
    config = requirePluginConfig("alpha"),
  },
}

return M
