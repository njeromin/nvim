local ok, tree = pcall(require, "neo-tree")
if not ok then return end

vim.g.neo_tree_remove_legacy_commands = 1

tree.setup({
  enable_git_status = false,
  popup_border_style = "solid",
  source_selector = {
    --winbar = true,
  },
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
  },
})
