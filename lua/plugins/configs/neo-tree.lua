vim.g.neo_tree_remove_legacy_commands = 1

require("neo-tree").setup({
  enable_git_status = false,
  popup_border_style = "solid",
  default_component_configs = {
    indent = {
      with_expanders = true,
    },
  },
  window = {
    width = "20%",
    popup = {
      position = "float",
    },
  },
  filesystem = {
    filtered_items = {
      visible = true,
    },
    use_libuv_file_watcher = true,
  },
})
