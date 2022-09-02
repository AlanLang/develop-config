-- 如果找不到toggleterm 组件，就不继续执行
local status, toggleterm = pcall(require, "toggleterm")
if not status then
    vim.notify("没有找到 toggleterm")
  return
end


toggleterm.setup({
  direction = 'float',
})
