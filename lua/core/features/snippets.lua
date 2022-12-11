local function module()
  local vscode = require("luasnip.loaders.from_vscode")

  vscode.lazy_load()
  vscode.lazy_load({ paths = vim.g.luasnippets_path or "" })

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function ()
      if
        require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require("luasnip").session.jump_active
      then
        require("luasnip").unlink_current()
      end
    end
  })
end

return {
  loads_self = true,
  packer = {
    {
      "rafamadriz/friendly-snippets",
      module = "cmp_nvim_lsp", -- load when cmp_nvim_lsp is loaded
    },
    {
      "saadparwaiz1/cmp_luasnip",
    },
    {
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets",
      config = module,
    }
  },
}
