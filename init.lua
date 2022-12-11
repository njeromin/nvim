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

-- lsp and completion
core.load_feature("completion")
core.load_feature("lsp")

-- load plugins
core.load_feature("packer")
