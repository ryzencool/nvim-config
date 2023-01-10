local status_ok, indent_line = pcall(require, "indent_blankline")

if not status_ok then
	return
end

indent_line.setup({
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
	space_char_blankline = " ",
})
