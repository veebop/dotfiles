local M = {}

function M.setup()
  require("lint").linters_by_ft = {
    -- Prose
    text = { "proselint", "write-good" },
    markdown = { "proselint", "write-good" },
    tex = { "proselint", "write-good" },
  }

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      -- Run the linters defined in linters_by_ft
      require("lint").try_lint()

      -- Run these linters on all filetypes
      require("lint").try_lint("codespell")
    end
  })
end

return M
