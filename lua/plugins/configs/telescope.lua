local telescope = require("telescope")

telescope.setup()

if packer_plugins["nvim-notify"] then
  telescope.load_extension("notify")
end
