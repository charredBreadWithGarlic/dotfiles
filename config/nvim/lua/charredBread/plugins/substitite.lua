return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitute = require("substitute")

		substitute.setup()

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		vim.keymap.set(
			"n",
			"<leader>rr",
			require("substitute.range").operator,
			{ noremap = true, desc = "Replace Range" }
		)
		vim.keymap.set(
			"x",
			"<leader>rr",
			require("substitute.range").visual,
			{ noremap = true, desc = "Replace Range" }
		)
		vim.keymap.set(
			"n",
			"<leader>rs",
			require("substitute.range").word,
			{ noremap = true, desc = "Replace Word in Range" }
		)
	end,
}
