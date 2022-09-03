-- 如果找不到 illuminate 组件，就不继续执行
local status, illuminate = pcall(require, "illuminate")
if not status then
    vim.notify("没有找到 illuminate")
  return
end

require('illuminate').configure({
    under_cursor = true,
})
