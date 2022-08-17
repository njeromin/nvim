local treesitter = require("nvim-treesitter.configs")

local opts = {
  highlight = {
    enable = true,
    use_languagetree = true
  },
}

local treesitter_opts = _G.config.options.treesitter

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
