-- 如果找不到trouble 组件，就不继续执行
local status, trouble = pcall(require, "trouble")
if not status then
    vim.notify("没有找到 trouble")
  return
end

trouble.setup()
