return {
  "ahmedkhalf/project.nvim",
  dependencies = { 'nvim-telescope/telescope.nvim' },
  event = "VeryLazy",
  config = function()
    require("telescope").load_extension("projects")
  end,
}
