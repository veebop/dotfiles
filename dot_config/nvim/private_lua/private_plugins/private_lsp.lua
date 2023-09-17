return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		"folke/neodev.nvim",
		"RRethy/vim-illuminate",
		"hrsh7th/cmp-nvim-lsp",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		-- Set up Mason before anything else
		require("mason").setup()
		require("mason-lspconfig").setup()
	end
}
