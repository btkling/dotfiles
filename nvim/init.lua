-- set up universal values before lazy
require("config.globals")
require("config.options")

-- lazy setup
require("core.lazy")

-- make sure plugins are setup before keymaps and autocommands
require("config.keymaps")
require("config.autocommands")

-- set the colorscheme
vim.cmd.colorscheme("tokyonight-night")
