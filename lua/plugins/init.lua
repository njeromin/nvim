local M = {}

local function requireConfig(configName)
  SafeRequire(string.format("plugins.configs.%s", configName))
end

M.rocks = {
  ["lua-toml"] = {},
}

M.nvim = {
  ["lewis6991/impatient.nvim"] = {},
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },
  ["kyazdani42/nvim-web-devicons"] = {},
  ["antoinemadec/FixCursorHold.nvim"] = {
    config = function () vim.g.cursorhold_updatetime = 100 end
  },

  ["rcarriga/nvim-notify"] = {
    config = function () vim.notify = require("notify") end
  },

  -- treesitter
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {},
  ["nvim-treesitter/nvim-treesitter"] = {
    config = function () requireConfig("treesitter") end,
    run = function () require('nvim-treesitter.install').update({ with_sync = true }) end,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    config = function () requireConfig("nvim-tree") end
  },

  ["nvim-telescope/telescope.nvim"] = {
    config = function () requireConfig("telescope") end
  },
}

return M
