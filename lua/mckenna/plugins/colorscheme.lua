return {
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	priority = 1000,
	config = function()
        vim.o.background = "light"
        vim.cmd([[colorscheme gruvbox]])
	end,
}
