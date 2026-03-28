vim.g.mapleader = " "

local function map(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<leader>pv", function() require("oil").open() end, "Open file explorer")

map("n", "gl", vim.diagnostic.open_float, "Line diagnostics")
map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

map({ "n", "x" }, "gf", function()
	require("conform").format()
end, "Format code")

map({ "n", "x" }, "<leader>cf", function()
	require("conform").format()
end, "Format code")

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP Actions",
	callback = function(event)
		local function lsp_map(mode, lhs, rhs, desc)
			map(mode, lhs, rhs, desc, { buffer = event.buf })
		end

		lsp_map("n", "K", vim.lsp.buf.hover, "Hover docs")
		lsp_map("n", "gd", vim.lsp.buf.definition, "Goto definition")
		lsp_map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
		lsp_map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
		lsp_map("n", "go", vim.lsp.buf.type_definition, "Goto type definition")
		lsp_map("n", "gr", vim.lsp.buf.references, "Goto references")
		lsp_map("n", "gs", vim.lsp.buf.signature_help, "Signature help")
		lsp_map("n", "<F2>", vim.lsp.buf.rename, "Rename symbol")
		lsp_map("n", "<F4>", vim.lsp.buf.code_action, "Code actions")
		lsp_map("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
		lsp_map("n", "<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
		lsp_map("n", "<leader>ch", vim.lsp.buf.hover, "Hover docs")
		lsp_map("n", "<leader>cr", vim.lsp.buf.rename, "Rename symbol")
	end,
})
