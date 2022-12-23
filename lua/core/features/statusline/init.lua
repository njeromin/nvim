local function module()
  local el = require("el")
  local builtin = require("el.builtin")
  local extensions = require("el.extensions")

  local function generator(win_id)
    local s = {}

    table.insert(s, require("core.features.statusline.components.mode"))
    s = require("core.features.statusline.components.file_info")(s)

    table.insert(s, "%=")

    table.insert(s, require("core.features.statusline.components.line_info"))

    return s
  end

  el.setup({
    generator = generator
  })
end

return {
  loads_self = true,
  packer = {
    {
      "tjdevries/express_line.nvim",
      config = module,
    },
  },
}
