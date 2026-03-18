return {
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	priority = 1000,
	config = function()
		local function system_background()
			local result = vim.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true }):wait()

			if result.code == 0 and result.stdout and result.stdout:match("Dark") then
				return "dark"
			end

			return "light"
		end

		local function apply_theme()
			local background = system_background()

			if vim.o.background ~= background or vim.g.colors_name ~= "gruvbox" then
				vim.o.background = background
				vim.cmd.colorscheme("gruvbox")
			end
		end

		apply_theme()

		vim.api.nvim_create_autocmd({ "FocusGained", "VimResume", "UIEnter" }, {
			group = vim.api.nvim_create_augroup("mckenna-system-theme", { clear = true }),
			callback = apply_theme,
		})

		vim.api.nvim_create_user_command("ThemeSync", apply_theme, { desc = "Sync theme with system appearance" })
	end,
}
