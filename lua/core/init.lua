core = {}

core.options = {}
core.load_options = function ()
  -- editor --
  core.options["editor"] = require("user.options.editor")
  -- indent
  local indent = core.options.editor.indent or 2
  vim.opt.shiftwidth = indent.width
  vim.opt.tabstop = indent.width
  vim.opt.softtabstop = indent.width
  vim.opt.smartindent = indent.smart or true
  vim.opt.autoindent = indent.auto or true
  if indent.style == "spaces" then vim.opt.expandtab = true end

  -- gui
  local font_name = core.options.editor.font.name
  local font_size = core.options.editor.font.size
  vim.opt.guifont = string.format("%s:%s", font_name, font_size)

  -- vim --
  core.options["vim"] = require("user.options.vim")
  for k, v in pairs(core.options.vim) do
    vim.opt[k] = v
  end
end

local function load_plugins_table()
  local ok, plugins = pcall(require, "plugins")
  if ok then
    return plugins
  else
    print(string.format("Failed to load plugins : %s", plugins))
    return {}
  end
end

core.enabled_features = vim.tbl_extend("keep", { ["packer"] = true }, require("user.options.core_features") or {})
core.loaded_features = {}
core.plugins = load_plugins_table()
core.load_feature = function (feature_name)
  -- check if feature is enabled
  local ef = core.enabled_features[feature_name]
  if not ef then return end

  -- load feature, printing error if it fails
  local ok, res = pcall(require, string.format("core.features.%s", feature_name))
  if not ok then 
    print(string.format("Failed to load core feature '%s' : %s", feature_name, res))
    return
  end

  if type(res.packer) == "table" then
    core.plugins = vim.list_extend(core.plugins, res.packer)
  end

  -- check if dependencies of the feature are loaded
  local can_load = true
  local feature_not_loaded
  for _, v in ipairs(res.requires or {}) do
    if not core.loaded_features[v] then can_load = false end
    feature_not_loaded = v
    break
  end
  -- print error if one is not found
  if not can_load then
    print(string.format("Failed to load core feature '%s' required by %s", feature_not_loaded, feature_name))
    return
  end

  -- run module
  if not res.loads_self then
    local m_ok, m_err = pcall(res.module, type(ef) == "table" and ef or {})
    if not m_ok then
      print(string.format("Failed to load core feature '%s's module : %s", feature_name, m_err))
      return
    end
  end

  -- add feature to loaded features
  core.loaded_features[feature_name] = true
end
