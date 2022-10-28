local utils = require("theme.utils")

local Colour = function (name, hsl)
  local ret =  {
    name = name,
    hsl = hsl,
    darken = function (percent)
      local copy = vim.deepcopy(ret.hsl)
      copy.l = copy.l - percent

      return utils.hsl_to_hex(copy)
    end,
    lighten = function (percent)
      local copy = vim.deepcopy(ret.hsl)
      copy.l = copy.l + percent

      return utils.hsl_to_hex(copy)
    end,
    get_hex = function ()
      return utils.hsl_to_hex(ret.hsl)
    end,
  }

  return ret
end

local M = {}

M.new = function (name, hex)
  local hsl = utils.hex_to_hsl(hex)
  return Colour(name, hsl)
end

return M
