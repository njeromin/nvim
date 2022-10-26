local telescope = require("telescope")

telescope.setup({})

pcall(telescope.load_extension, "notify")
