local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then return end

local opts = {
  highlight = {
    enable = true,
    use_languagetree = true
  },
}

local treesitter_opts = require("user.config").treesitter or {}

if treesitter_opts.textobjects then
  opts.textobjects = {
    select = {
      enable = true,
      lookahead = true
    },
    lsp_interop = {
      enable = true,
      border = "none"
    },
  }
end

if treesitter_opts.rainbow_pairs then
  opts.rainbow = {
    enable = true,
  }
end

treesitter.setup(opts)
