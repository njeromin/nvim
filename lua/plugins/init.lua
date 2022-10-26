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

  -- lsp
  u {
    "neovim/nvim-lspconfig",
    after = "mason-lspconfig.nvim",
    requires = {
      "folke/neodev.nvim",
    },
    config = function () import("plugins.configs.lsp") end,
  }
  u {
    "j-hui/fidget.nvim",
    config = function () import("plugins.configs.fidget") end,
  }

  -- general
  u {
    "windwp/nvim-autopairs",
    config = function () import("plugins.configs.autopairs") end,
  }
  u {
    "nvim-neo-tree/neo-tree.nvim",
    config = function () import("plugins.configs.neo-tree") end,
  }
  u {
    "kevinhwang91/nvim-hlslens",
    config = function () import("plugins.configs.hlslens") end,
  }
  u {
    "petertriho/nvim-scrollbar",
    config = function () import("plugins.configs.scrollbar") end,
  }
  u {
    "lewis6991/gitsigns.nvim",
    config = function () require("gitsigns").setup() end,
  }
  u {
    "nvim-telescope/telescope.nvim",
    config = function () import("plugins.configs.telescope") end,
  }

  u {
    "ellisonleao/gruvbox.nvim",
    module = "gruvbox",
  }
  u {
    "rktjmp/lush.nvim",
    config = function () import("theme") end,
  }
  --[[u {
    "projekt0n/github-nvim-theme",
    config = function () require("github-theme").setup({ theme_style = "dimmed" }) end,
  }]]
end
