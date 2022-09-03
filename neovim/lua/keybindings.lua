local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 保存命令的快捷键
map('n', '<C-s>', ':w<cr>', opt)
map('i', '<C-s>', '<Esc>:w<cr>', opt)

-- windows 分屏快捷键
map("n", "<C-l>", ":vsp<CR>", opt)
map("n", "<C-j>", ":sp<CR>", opt)
-- 关闭当前
map("n", "<C-c>", "<C-w>c", opt)

-- 关闭其他
map("n", "<C-x>", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)

-- 打开问题栏
map("n", "<C-t>", ":Trouble<CR>", opt)
-- 打开控制台
map("n", "<C-z>", ":ToggleTerm<CR>", opt)
-- 关闭控制台
map("t", "<esc>", [[<C-\><C-n><C-w>c]], opt)

-- bufferline
-- 左右Tab切换
map("n", "<leader>th", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>tl", ":BufferLineCycleNext<CR>", opt)
map("n", "<leader>tc", ":BufferLineCloseLeft<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-S-p>", ":Telescope command_center<CR>", opt)
-- 定位到下一个相同的单词
map("n", "<C-m>", ":IlluminateNextReference<CR>", opt)

-- 定位到上一个相同的单词
map("n", "<C-S-m>", ":IlluminatePrevReference<CR>", opt)

-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- 清理提示
map("n", "<leader>c", ":nohl<CR>", opt)
-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
map("n", "<C-e>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- 重命名
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  -- 列出可以执行的操作
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  -- 跳转到定义的地方
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  -- 显示信息
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
  mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 未用
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- telescope 快捷键设置
pluginKeys.mapTelescope = {
  -- 使用分屏打开文件
  ["<C-l>"] = "select_vertical",
}

-- typescript 快捷键
pluginKeys.mapTsLSP = function(mapbuf)
  mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
  -- mapbuf("n", "gr", ":TSLspRenameFile<CR>", opt)
  mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ["<C-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<C-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<up>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<down>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
  end

return pluginKeys
