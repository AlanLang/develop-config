local packer = require("packer")
packer.startup(
  function(use)
   -- Packer 可以管理自己本身
   use 'wbthomason/packer.nvim'
   -- oceanic-next
   use 'AlanLang/oceanic-next'
   -- transparent
   use 'xiyaowong/nvim-transparent'
   -- 文件目录栏
   use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
   -- bufferline tab标题
   use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
   -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope 
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- dashboard-nvim 
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter 
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    --------------------- LSP --------------------
    use("williamboman/nvim-lsp-installer")
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
        -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- 代码补全美化
    use("onsails/lspkind-nvim")
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    use("tami5/lspsaga.nvim" )
    -- 代码格式化
    -- use("mhartington/formatter.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    -- JSON 增强
    use("b0o/schemastore.nvim")
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    -- 括号自动补全
    use ("windwp/nvim-autopairs")
    -- 平滑滚动
    use("karb94/neoscroll.nvim")
    -- 错误列表
    use("folke/trouble.nvim")
    -- 命令行
    use("akinsho/toggleterm.nvim")
    -- 快捷命令
    use {
      "FeiyouG/command_center.nvim",
      requires = { "nvim-telescope/telescope.nvim" }
    }
    -- 光标多选
    use("mg979/vim-visual-multi")
    -- 高亮相同的单词
    use{"AlanLang/vim-illuminate"}
    -- 快捷块选中
    use("mfussenegger/nvim-treehopper")
    -- 文件打开历史
    use("gaborvecsei/memento.nvim")
    -- 快速注释
    use("numToStr/Comment.nvim")
    -- git 信息
    use ("f-person/git-blame.nvim")
    use ("windwp/nvim-ts-autotag")
end)

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
