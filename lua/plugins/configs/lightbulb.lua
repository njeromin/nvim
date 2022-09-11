local ok, lb = pcall(require, "nvim-lightbulb")
if not ok then return end

lb.setup({
  sign = {
    enabled = false,
  },
  virtual_text = {
    enabled = true,
    text = "  ",
    hl_mode = "combine",
  },
  autocmd = {
    enabled = true,
  },
})
