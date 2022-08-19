local ok, iom = pcall(require, "indent-o-matic")
if not ok then return end

iom.setup({
  max_lines = 1000,
  skip_multiline = true,
})
