local tree = require("nvim-tree")

tree.setup({
  hijack_cursor = true,
  open_on_setup = true,
  open_on_setup_file = true,
  ignore_ft_on_setup = { "alpha" },
  view = {
    adaptive_size = true,
    preserve_window_proportions = true,
    hide_root_folder = true,
  },
  diagnostics = {
    enable = true
  },
  git = {
    enable = false,
    ignore = true,
  },
  actions = {
    change_dir = {
      restrict_above_cwd = true,
    },
    open_file = {
      resize_window = true,
    }
  }
})
