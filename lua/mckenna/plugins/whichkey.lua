return {
	"folke/which-key.nvim",
	event = "VeryLazy",
		opts = {
			delay = 300,
			triggers = {
				{ "<auto>", mode = "nxso" },
				{ "g", mode = { "n", "x" } },
			},
			spec = {
				{ "<leader>c", group = "code" },
				{ "<leader>f", group = "find" },
				{ "<leader>g", group = "git" },
				{ "<leader>o", group = "opencode" },
				{ "<leader>p", group = "project" },
				{ "g", group = "goto" },
			},
		},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer local keymaps",
		},
	},
}
