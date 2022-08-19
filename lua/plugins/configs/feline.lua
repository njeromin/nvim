local ok, feline = pcall(require, "feline")
if not ok then return end

local components = {
  active = { {}, {}, {} },
  inactive = { {}, {} },
}

feline.setup({})

local navic_ok, navic = pcall(require, "nvim-navic")
if not navic_ok then return end

-- todo highlighting for navic
if true then return end

local winbar = {
  active = { {}, {}, {} },
  inactive = { {}, {} },
}

table.insert(winbar.active[1], {
  provider = function ()
    return navic.get_location()
  end,
  enabled = function ()
    return navic.is_available()
  end
})

feline.winbar.setup({
  components = winbar,
})
