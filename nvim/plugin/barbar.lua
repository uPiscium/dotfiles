local status, barbar = pcall(require, "barbar")
if not status then
	return
end

barbar.setup({
	animation = false,
	auto_hide = false,
	tabpages = true,
	icons = {
		buffer_index = false,
		buffer_number = false,
		button = " ",
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = true },
		},
		gitsigns = {
			added = { enabled = true, icon = "" },
			changed = { enabled = true, icon = "" },
			deleted = { enabled = true, icon = "" },
		},
		filetype = {
			custom_colors = false,
			enabled = true,
		},
		preset = "default",
	},
})
