local ok, telescope = pcall(require, "telescope")
if not ok then return end

telescope.setup()

SafeRequire("notify", function ()
  telescope.load_extension("notify")
end)
