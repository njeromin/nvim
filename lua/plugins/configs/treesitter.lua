local treesitter = require("nvim-treesitter.configs")

local opts = {
  highlight = {
    enable = true,
    use_languagetree = true
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true
    },
    lsp_interop = {
      enable = true,
      border = "none"
    }
  }
}

treesitter.setup(opts)
