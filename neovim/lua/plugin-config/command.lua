local status, command_center = pcall(require, "command_center")
if not status then
    vim.notify("没有找到 command_center")
  return
end

local noremap = {noremap = true}
local silent_noremap = {noremap = true, silent = true}


command_center.add({
    {
      desc = "open file",
      cmd = ":Telescope find_files<CR>",
      keys = { "n", "<C-p>", noremap },
    },
    {
      desc = "open trouble line",
      cmd = ":Trouble<CR>",
      keys = { "n", "<C-t>", noremap },
    },
    {
      desc = "open term",
      cmd = ":ToggleTerm<CR>",
      keys = { "n", "<C-z>", noremap },
    },
    {
      desc = "open file tree",
      cmd = ":NvimTreeToggle<CR>",
      keys = { "n", "<C-e>", noremap },
    },
    {
      desc = "split screen to left",
      cmd = ":vsp<CR>",
      keys = { "n", "<C-l>", noremap },
    },
    {
      desc = "split screen to bottom",
      cmd = ":sp<CR>",
      keys = { "n", "<C-j>", noremap },
    },
    {
      desc = "close current screen",
      cmd = "<C-w>c",
      keys = { "n", "<C-c>", noremap },
    },
    {
      desc = "close other screen",
      cmd = "<C-w>o",
      keys = { "n", "<C-x>", noremap },
    },
    {
      desc = "find file",
      cmd = ":Telescope live_grep<CR>",
      keys = { "n", "<C-f>", noremap },
    },
    {
      desc = "save change",
      cmd = ":w<cr>",
      keys = { "n", "<C-s>", noremap },
    },
    {
      desc = "format lsp",
      cmd = "<cmd>lua vim.lsp.buf.formatting()<CR>",
      keys = { "n", "<leader>f", noremap },
    },
    {
      desc = "import all auto",
      cmd = ":TSLspImportAll<CR>",
      keys = { "n", "gi", noremap },
    },
    {
      desc = "multi select word",
      cmd = "<C-n>",
      keys = { "n", "<C-n>", noremap },
    }
})