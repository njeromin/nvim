---- core ----
require("core")

-- load impatient
core.load_feature("impatient")
core.load_feature("disable_builtins")
core.load_feature("disable_providers")
core.load_feature("autocommands")

-- load user options
core.load_options()
core.load_feature("neovide")
core.load_feature("mappings")
core.load_feature("interface")

-- lsp and completion
core.load_feature("snippets")
core.load_feature("completion")
core.load_feature("dap")
core.load_feature("lsp")
core.load_feature("formatting")

-- extra features
core.load_feature("terminal")

-- load plugins
core.load_feature("packer")
