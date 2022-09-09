return function (lspconfig, default_config)
  local ok, luadev = pcall(require, "lua-dev")
  if not ok then
    return lspconfig["sumneko_lua"].setup(default_config)
  end

  local config = luadev.setup({
    library = {
      vimruntime = true,
      types = true,
      plugins = true,
    },
    runtime_path = true,
    lspconfig = vim.tbl_extend("keep", default_config, {
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    })
  })

  lspconfig["sumneko_lua"].setup(config)
end
