local M = {}

M.tohexstring = function (col)
	return tostring(col):gsub("0x", "#", 1)
end

local function lighten_darken(col, amt)
	local num = tonumber(col:sub(2), 16)
	local r = bit.rshift(num, 16) + amt
	local b = bit.band(bit.rshift(num, 8), 0x00FF) + amt
	local g = bit.band(num, 0x0000FF) + amt
	local newColour = bit.bor(g, bit.bor(bit.lshift(b, 8), bit.lshift(r, 16)))

	return M.tohexstring(string.format("%#x", newColour))
end

M.lighten = function (col, amt)
	return lighten_darken(col, amt)
end

M.darken = function (col, amt)
	return lighten_darken(col, -amt)
end

return M
