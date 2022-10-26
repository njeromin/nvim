require("fidget").setup({
  text = {
    spinner = "dots",
    done = "",
  },
  window = {
    relative = "editor",
  },
  sources = {
    ["null_ls"] = { ignore = true },
  }
})
