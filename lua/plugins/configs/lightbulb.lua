local ok, lb = pcall(require, "nvim-lightbulb")
if not ok then return end

lb.setup({
  autocmd = {
    enabled = true,
  },
})
