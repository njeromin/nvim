-- input: use, use_rock
return function (u)
  -- libraries/utilities
  u {
    "nvim-lua/plenary.nvim",
    module = "plenary",
  }
  u {
    "kyazdani42/nvim-web-devicons",
    config = function () import("plugins.configs.icons") end,
  }
  u {
    "MunifTanjim/nui.nvim",
    module = "nui",
  }
  u {
    "stevearc/dressing.nvim",
    config = function () require("dressing").setup() end,
  }
  u {
    "rcarriga/nvim-notify",
    config = function () vim.notify = require("notify") end,
  }
  u {
    "miversen33/netman.nvim",
    config = function () require("netman") end,
  }
  u {
    "famiu/bufdelete.nvim",
    module = "bufdelete",
  }

  -- mason
  u {
    "williamboman/mason.nvim",
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "jayp0521/mason-null-ls.nvim",
      "jayp0521/mason-nvim-dap.nvim",
    },
    config = function () import("plugins.configs.mason") end,
  }

  -- treesitter
  u {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
    },
    config = function () import("plugins.configs.treesitter") end,
    run = function () require("nvim-treesitter.install").update({ with_sync = true }) end,
  }

  -- nvim-cmp
  u {
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind.nvim",

      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "David-Kunz/cmp-npm",
    },
    config = function () import("plugins.configs.cmp") end,
  }
  u {
    "rafamadriz/friendly-snippets",
    module = "cmp_nvim_lsp",
  }
  u {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    config = function () import("plugins.configs.cmp.luasnip") end,
  }

  -- lsp
  u {
    "neovim/nvim-lspconfig",
    after = "mason-lspconfig.nvim",
    requires = {
      { "folke/neodev.nvim", module = "neodev" },
      { "simrat39/rust-tools.nvim", module = "rust-tools" },
      { "jose-elias-alvarez/typescript.nvim", module = "typescript" },
      { "someone-stole-my-name/yaml-companion.nvim", module = "yaml-companion" },
      { "b0o/SchemaStore.nvim", module = "schemastore" },
    },
    config = function () import("plugins.configs.lsp") end,
  }
  u {
    "j-hui/fidget.nvim",
    config = function () import("plugins.configs.fidget") end,
  }

  -- formatting
  u {
    "jose-elias-alvarez/null-ls.nvim",
    config = function () import("plugins.configs.null") end,
  }

  -- general
  u {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function () import("plugins.configs.autopairs") end,
  }
  u {
    "nvim-neo-tree/neo-tree.nvim",
    config = function () import("plugins.configs.neo-tree") end,
  }
  u {
    "akinsho/bufferline.nvim",
    config = function () import("plugins.configs.bufferline") end,
  }
  u {
    "kevinhwang91/nvim-hlslens",
    config = function () import("plugins.configs.hlslens") end,
  }
  u {
    "petertriho/nvim-scrollbar",
    event = "BufRead",
    config = function () import("plugins.configs.scrollbar") end,
  }
  u {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function () require("gitsigns").setup() end,
  }
  u {
    "lukas-reineke/indent-blankline.nvim",
    config = function () import("plugins.configs.indent-blankline") end,
  }
  u {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function () require("Comment").setup() end,
  }
  u {
    "nvim-telescope/telescope.nvim",
    config = function () import("plugins.configs.telescope") end,
  }
  u {
    "tjdevries/express_line.nvim",
    config = function () import("plugins.configs.statusline") end,
  }
  u {
    "ziontee113/icon-picker.nvim",
    module = "icon-picker",
    config = function () import("plugins.configs.icon-picker") end,
  }
  u {
    "folke/noice.nvim",
    config = function () import("plugins.configs.noice") end,
  }
  u {
    "Pocco81/auto-save.nvim",
    event = "BufRead",
    config = function () import("plugins.configs.auto-save") end,
  }
  u {
    "goolord/alpha-nvim",
    config = function () import("plugins.configs.alpha") end,
  }
  u {
    "akinsho/toggleterm.nvim",
    config = function () import("plugins.configs.toggleterm") end,
  }
  u {
    "m-demare/attempt.nvim",
    config = function () import("plugins.configs.attempt") end,
  }
  u {
    "uga-rosa/ccc.nvim",
    config = function () import("plugins.configs.ccc") end,
  }
  u {
    "folke/which-key.nvim",
    config = function () import("core.mappings") end,
  }

  -- language plugins
  u {
    "ziglang/zig.vim",
  }
end
