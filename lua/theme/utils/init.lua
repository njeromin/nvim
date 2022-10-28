local M = {}

local function round(x, p)
  local power = 10 ^ (p or 0)
  return (x * power + 0.5 - (x * power + 0.5) % 1) / power
end

M.groups = {}

M.group = function (name, hl)
  M.groups[name] = hl

  for k, v in hl do
    if type(v) == "table" then
      for ki, vi in v do
        hl[k][ki] = vi
      end
    end
  end

  vim.api.nvim_set_hl(0, name, hl)
end

-- returns {r, g, b}
M.hex_to_rgb = function (hex)
  hex = hex:gsub("#", "")
  return {
    r = tonumber("0x"..hex:sub(1,2)),
    g = tonumber("0x"..hex:sub(3,4)),
    b = tonumber("0x"..hex:sub(5,6))
  }
end

-- returns {h, s, l}
M.rgb_to_hsl = function (obj)
  local r = obj.r or obj[1]
  local g = obj.g or obj[2]
  local b = obj.b or obj[3]

  local R, G, B = r / 255, g / 255, b / 255
  local max, min = math.max(R, G, B), math.min(R, G, B)
  local l, s, h

  -- Get luminance
  l = (max + min) / 2

  -- short circuit saturation and hue if it's grey to prevent divide by 0
  if max == min then
    s = 0
    h = obj.h or obj[4] or 0
    return 0, 0, l
  end

  -- Get saturation
  if l <= 0.5 then s = (max - min) / (max + min)
  else s = (max - min) / (2 - max - min)
  end

  -- Get hue
  if max == R then h = (G - B) / (max - min) * 60
  elseif max == G then h = (2.0 + (B - R) / (max - min)) * 60
  else h = (4.0 + (R - G) / (max - min)) * 60
  end

  -- Make sure it goes around if it's negative (hue is a circle)
  if h ~= 360 then h = h % 360 end

  return { h = h, s = s, l = l }
end

M.hex_to_hsl = function (hex)
  return M.rgb_to_hsl(M.hex_to_rgb(hex))
end

M.hsl_to_rgb = function (obj)
  local h = obj.h or obj[1]
  local s = obj.s or obj[2]
  local l = obj.l or obj[3]

  local temp1, temp2, temp_r, temp_g, temp_b, temp_h

  -- Set the temp variables
  if l <= 0.5 then temp1 = l * (s + 1)
  else temp1 = l + s - l * s
  end

  temp2 = l * 2 - temp1

  temp_h = h / 360

  temp_r = temp_h + 1/3
  temp_g = temp_h
  temp_b = temp_h - 1/3


  -- Make sure it's between 0 and 1
  if temp_r ~= 1 then temp_r = temp_r % 1 end
  if temp_g ~= 1 then temp_g = temp_g % 1 end
  if temp_b ~= 1 then temp_b = temp_b % 1 end

  local rgb = {}

  -- Bunch of tests
  -- Once again I haven't the foggiest what any of this does
  for _, v in pairs({{temp_r, "r"}, {temp_g, "g"}, {temp_b, "b"}}) do

    if v[1] * 6 < 1 then rgb[v[2]] = temp2 + (temp1 - temp2) * v[1] * 6
    elseif v[1] * 2 < 1 then rgb[v[2]] = temp1
    elseif v[1] * 3 < 2 then rgb[v[2]] = temp2 + (temp1 - temp2) * (2/3 - v[1]) * 6
    else rgb[v[2]] = temp2
    end

  end

  return {
    r = round(rgb.r * 255),
    g = round(rgb.g * 255),
    b = round(rgb.b * 255)
  }
end

M.rgb_to_hex = function (obj)
  local r = obj.r or obj[1]
  local g = obj.g or obj[2]
  local b = obj.b or obj[3]
  local h = (obj.hashtag or obj[4]) and "#" or ""
  return h..string.format("%02x%02x%02x",
    math.floor(r),
    math.floor(g),
    math.floor(b))
end

M.hsl_to_hex = function (hsl)
  return M.rgb_to_hex(M.hsl_to_rgb(hsl))
end

return group, groups, M
