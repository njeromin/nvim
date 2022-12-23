local function module()
  local el = require("el")
  local extensions = require("el.extensions")

  local function generator(win_id)
    local s = {}

    table.insert(s, extensions.mode)

    table.insert(s, "%=")

    table.insert(s, "test")

    table.insert(s, "%=")

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
