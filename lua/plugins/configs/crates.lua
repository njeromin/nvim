local ok, crates = pcall(require, "crates")
if not ok then return end

crates.setup()
SafeRequire("cmp", function (cmp)
  cmp.setup.buffer({ sources = { { name = "crates" } } })
end)
