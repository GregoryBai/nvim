-- All paths must be relative to this one, except the Packer config
require("options")
require("plugins")
require("autocmd")
require("keymaps")

-- setup must be called before loading
require("colorscheme")

-- HACK: "this is a hack"
-- FIXME: <tag>  some_text </tag<
