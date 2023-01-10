local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

local status_ok1, onedark = pcall(require, "onedark")

if not status_ok1 then
  return
end

onedark.load()
