return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, "Next hunk")

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, "Previous hunk")

				-- Actions
				map("n", "<leader>gs", gitsigns.stage_hunk, "Stage hunk")
				map("n", "<leader>gr", gitsigns.reset_hunk, "Reset hunk")

				map("v", "<leader>gs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk")
				map("v", "<leader>gr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk")

				map("n", "<leader>gp", gitsigns.preview_hunk, "Preview hunk")
				map("n", "<leader>gb", gitsigns.toggle_current_line_blame, "Toggle line blame")
			end,
		})
	end,
}
