require("toggleterm").setup({
	size = 20,
	open_mapping = [[<C-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = false,
	-- shading_factor = 1,
	start_in_insert = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 30,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
