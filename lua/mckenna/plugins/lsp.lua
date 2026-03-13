return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Set default capabilities for all LSP servers via Neovim 0.11 API
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- Custom config for lua_ls to suppress vim global warning
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"lua_ls",
					"svelte",
					"tailwindcss",
					"ts_ls",
				},
				-- Automatically enable installed servers via vim.lsp.enable()
				automatic_enable = true,
			})
		end,
	},
}
