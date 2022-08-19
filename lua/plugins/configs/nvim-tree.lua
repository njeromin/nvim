local ok, tree = pcall(require, "nvim-tree")
if not ok then return end

tree.setup({
  hijack_cursor = true,
  ignore_ft_on_setup = { "alpha" },
  view = {
    adaptive_size = true,
    preserve_window_proportions = true,
    hide_root_folder = false,
    width = 25,
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
