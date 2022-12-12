local function module()  
  require("toggleterm").setup({
    winbar = {
      enabled = true,
      name_formatter = function (term) return term.name end,
    },
  })
end

return {
  loads_self = true,
  packer = {
    {
      "akinsho/toggleterm.nvim",
      cmd = "ToggleTerm",
      config = module,
    }
  },
}
