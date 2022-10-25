return function (u, ur)
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
  }
  u {
    "stevearc/dressing.nvim",
    config = function () require("dressing").setup() end,
  }
  u {
    "rcarriga/nvim-notify",
    config = function () vim.notify = require("notify") end,
  }

  -- treesitter
  u {
    "nvim-treesitter/nvim-treesitter",
    requries = { "windwp/nvim-ts-autotag" },
    config = function () import("plugins.configs.treesitter") end,
    run = function () require("nvim-treesitter.install").update({ with_sync = true }) end,
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
    "projekt0n/github-nvim-theme",
    config = function () require("github-theme").setup({ theme_style = "dimmed" }) end,
  }
end
