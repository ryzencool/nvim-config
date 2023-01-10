local status_ok, recent_files = pcall(require, "recent_files")

if not status_ok then
	return
end

recent_files.setup({})
