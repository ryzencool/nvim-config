local status_ok, clip = pcall(require, "neoclip")

if not status_ok then
  return
end

clip.setup()
