local status_ok, dashboard = pcall(require, "dashboard")

if not status_ok then
	return
end

dashboard.custom_center = {
	{ desc = "find projects                                 SPC p", action = "Telescope projects" },
	{ desc = "find files                                    SPC f", action = "Telescope find_files" },
}
