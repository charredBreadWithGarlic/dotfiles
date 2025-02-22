return {
	-- wiki: https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {},
	dependencies = { "nvim-treesitter/nvim-treesitter" }, --, "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	config = function()
		require("render-markdown").setup({
			file_types = { "markdown", "gitcommit" },
		})
		require("render-markdown").toggle()
	end,
}
