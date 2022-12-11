local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = { "lua", "vim", "help" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  textobjects = { lsp_interop = { enable = true } },
  context_commentstring = { enable = true },
  autotag = { enable = true },
})
