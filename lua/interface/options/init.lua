local M = {}

local Tree = require("nui.tree")
local Popup = require("nui.popup")
local Layout = require("nui.layout")

local p_sidebar = Popup({
  border = "single",
})

local p_main = Popup({
  border = "single",
  enter = true,
})

local layout = Layout(
  {
    relative = "editor",
    position = "50%",
    size = {
      width = 80,
      height = "60%",
    },
  },
  Layout.Box({
    Layout.Box(p_sidebar, { size = "30%" }),
    Layout.Box(p_main, { size = "70%" }),
  }, { dir = "row" })
)

local option_groups = { "core_features", "editor", "mappings", "vim" }
local tree_nodes = {}
for i, v in ipairs(option_groups) do
  table.insert(tree_nodes, Tree.Node({ text = string.format(" %s", v) }))
end

local tree = Tree({
  bufnr = p_sidebar.bufnr,
  nodes = tree_nodes,
})
tree:render()

M.open = function ()
  layout:mount()
end

M.close = function ()
  layout:unmount()
end

return M
