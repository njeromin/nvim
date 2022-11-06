require("toggleterm").setup({
  float_opts = {
    border = "curved",
  },
  winbar = {
    enabled = true,
    name_formatter = function (term) --  term: Terminal
      return term.name
    end
  },
  highlights = {
    Normal = {
      guibg = "#111111",
    },
    NormalFloat = {
      guibg = "#111111",
    },
    FloatBorder = {
      guifg = "#111111",
      guibg = "#111111",
    },
  },
})

-- mappings
vim.keymap.set({ "n", "i" }, "<A-f>", "<cmd>ToggleTerm direction=float<cr>", { noremap = true, silent = true })
