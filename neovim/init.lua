--- 基础设置
require('basic')
require('plugins')
require('colorscheme')
require('keybindings')
-- 插件配置
require("plugin-config.nvim-tree")
-require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
-- 内置LSP 
require("lsp.setup")
