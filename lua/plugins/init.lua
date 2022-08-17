local M = {}

function RequirePluginConfig(configName, handler)
  SafeRequire(string.format("plugins.configs.%s", configName), handler)
end

M.rocks = {
  ["toml"] = {},
}

M.nvim = {
  ["lewis6991/impatient.nvim"] = {},
  ["nvim-lua/plenary.nvim"] = {},
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
    config = RequirePluginConfig("mason", function (cfg) cfg.mason() end),
  },
  ["williamboman/mason-lspconfig.nvim"] = {
    config = RequirePluginConfig("mason", function (cfg) cfg.mason_lspconfig() end),
  },

  -- treesitter
  ["nvim-treesitter/nvim-treesitter"] = {
    disable = not _G.config.options.treesitter.enable,
    config = RequirePluginConfig("treesitter"),
    run = function () require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    disable = not _G.config.options.treesitter.textobjects,
  },
  ["p00f/nvim-ts-rainbow"] = {
    disable = not _G.config.options.treesitter.rainbow_pairs,
  },
  ["lewis6991/spellsitter.nvim"] = {
    disable = not _G.config.options.treesitter.spellsitter,
    config = function () require("spellsitter").setup() end,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    config = RequirePluginConfig("nvim-tree"),
  },
  ["nvim-telescope/telescope.nvim"] = {
    config = RequirePluginConfig("telescope"),
  },
  ["Pocco81/auto-save.nvim"] = {
    disable = not _G.config.options.autosave,
    config = function () require("auto-save").setup() end,
  },
  ["folke/which-key.nvim"] = {
    config = RequirePluginConfig("whichkey")
  },
}

return M
