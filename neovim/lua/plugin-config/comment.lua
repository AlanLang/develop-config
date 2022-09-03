-- 如果找不到comment 组件，就不继续执行
local status, comment = pcall(require, "Comment")
if not status then
    vim.notify("没有找到 comment")
  return
end

comment.setup()
