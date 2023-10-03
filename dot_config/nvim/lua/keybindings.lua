-- Make navigating between splits more ergonomic
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Move text up and down
-- Visual --
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
-- Visual Block --
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- (Basically) How fast which_key opens
vim.o.timeoutlen = 500

require("which-key").register({
  ["<leader>"] = {
    [';'] = { "<cmd>Alpha<CR>", "Alpha" },
    ['/'] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
    c = { "<cmd>bd<CR>", "Close Buffer" },
    f = { "<cmd>Telescope git_files<CR>", "Search project files" },
    h = { "<cmd>nohlsearch<CR>", "No Highlight" },
    e = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },
    z = { "<cmd>ZenMode<CR>", "Zen Mode" },
    b = {
      name = "Buffers",
      j = { "<cmd>BufferLinePick<cr>", "Jump" },
      f = { "<cmd>Telescope buffers <cr>", "Find" },
      b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
      n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
      e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close", },
      h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
      l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right", },
      D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory", },
      L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language", },
    },
    d = {
      name = "Debug",
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
      p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
    },
    g = {
      name = "Git",
      j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)", },
      d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff", },
    },
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
      w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
      -- I may want to change this to something later, when I decide on a plugin to format with
      f = { "<cmd>lua vim.lsp.buf.format<cr>", "Format" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>Mason<cr>", "Mason Info" },
      j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic", },
      k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
      e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    },
    s = {
      name = "Search",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer" },
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      t = { "<cmd>Telescope live_grep<cr>", "Text" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
      l = { "<cmd>Telescope resume<cr>", "Resume last search" },
      p = {
        "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
        "Colorscheme with Preview",
      },
      T = { "<cmd>Telescope<cr>", "Telescope" }
    },
    n = {
      name = "Neorg",
      n = { "<cmd> Neorg workspace notes<CR>", "Open notes" },
      t = { "<cmd>Neorg journal today<CR>", "Today's journal" },
      j = { "<cmd>Neorg journal<CR>", "Journal" },
      i = { "<cmd>Neorg index<CR>", "Open index" },
    },
    r = {
      name = "Rust",
      r = { "<cmd>RustRunnables<Cr>", "Runnables" },
      t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
      m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
      c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
      p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
      d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
      v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
      R = {
        "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
        "Reload Workspace",
      },
      o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
      y = { "<cmd>lua require'crates'.open_repository()<cr>", "[crates] open repository" },
      P = { "<cmd>lua require'crates'.show_popup()<cr>", "[crates] show popup" },
      i = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "[crates] show info" },
      f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "[crates] show features" },
      D = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "[crates] show dependencies" },
      a = { "Code action group" },
    },
  }
})
