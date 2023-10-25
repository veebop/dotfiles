local M = {}

-- Make navigating between splits more ergonomic
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Move text up and down
-- Visual --
vim.keymap.set("v", "<A-j>", ":m .+1<cr>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m .-2<cr>==", { noremap = true, silent = true })
-- Visual Block --
vim.keymap.set("x", "<A-j>", ":move '>+1<cr>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<cr>gv-gv", { noremap = true, silent = true })

-- (Basically) How fast which_key opens
vim.o.timeoutlen = 500

require("which-key").register({
  ["<leader>"] = {
    [';'] = { "<cmd>Alpha<cr>", "Alpha" },
    c = { "<cmd>bd<cr>", "Close Buffer" },
    e = { "<cmd>NvimTreeToggle<cr>", "File Explorer" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    h = { "<cmd>nohlsearch<cr>", "No Highlight" },
    p = { "<cmd>Telescope git_files<cr>", "Search project files" },
    w = { "<cmd>set eventignore+=BufWritePre | w | set eventignore-=BufWritePre<cr>", "Write without formatting" },
    z = { "<cmd>ZenMode<cr>", "Zen Mode" },
    b = {
      name = "Buffers",
      b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
      e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close", },
      f = { "<cmd>Telescope buffers <cr>", "Find" },
      h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
      j = { "<cmd>BufferLinePick<cr>", "Jump" },
      l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right", },
      n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
      D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory", },
      L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language", },
    },
    d = {
      name = "Debug",
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
      C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
      U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
    },
    g = {
      name = "Git",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff", },
      j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
      C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)", },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    },
    n = {
      name = "Neorg",
      i = { "<cmd>Neorg index<cr>", "Open index" },
      j = { "<cmd>Neorg journal<cr>", "Journal" },
      n = { "<cmd> Neorg workspace notes<cr>", "Open notes" },
      t = { "<cmd>Neorg journal today<cr>", "Today's journal" },
    },
    s = {
      name = "Search",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer" },
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      l = { "<cmd>Telescope resume<cr>", "Resume last search" },
      p = { "<cmd>Telescope git_files<cr>", "Search project files", },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      t = { "<cmd>Telescope live_grep<cr>", "Text" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
      H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      T = { "<cmd>Telescope<cr>", "Telescope" },
    },
  }
})

----- BUFFER SPECIFIC BINDINGS -----
-- Set up LSP Keybindings
function M.lsp_keybindings(bufnr)
  require("which-key").register({
    a = { "<cmd>CodeActionMenu", "Code Actions" },
    g = {
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "List implementations" },
      r = { "<cmd>lua vim.lsp.buf.references()<cr>", "List references" },
    },
    K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Info" },
    ["<leader>"] = {
      l = {
        name = "LSP",
        a = { "<cmd>CodeActionMenu<cr>", "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature help" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic", },
        k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go to type definition" },
        w = {
          name = "Workspace",
          d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
          a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace folder" },
          r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace folder" },
          l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List workspace folders" },
          s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
        },
        I = { "<cmd>NullLsInfo<cr>", "Null-LS info" },
        S = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
      },
    },
  }, { buffer = bufnr, mode = "n" })
end

-- Set up rust specific keybindings
function M.rust_keybindings(bufnr)
  require("which-key").register({
    K = { "<cmd>lua require('rust-tools').hover_actions.hover_actions", "Rust Hover" },
    ["<localleader>"] = {
      name = "Rust",
      a = { "<cmd>lua require('rust-tools').code_action_group.code_action_group()<cr>", "Code action group" },
      c = { "<cmd>RustOpenCargo<cr>", "Open Cargo" },
      d = { "<cmd>RustDebuggables<cr>", "Debuggables" },
      m = { "<cmd>RustExpandMacro<cr>", "Expand Macro" },
      o = { "<cmd>RustOpenExternalDocs<cr>", "Open External Docs" },
      p = { "<cmd>RustParentModule<cr>", "Parent Module" },
      r = { "<cmd>RustRunnables<cr>", "Runnables" },
      t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
      v = { "<cmd>RustViewCrateGraph<cr>", "View Create Graph" },
      R = {
        "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<cr>",
        "Reload Workspace",
      },
    },
  }, { buffer = bufnr, mode = "n" })
end

-- Cargo.toml keybindings
function M.crate_keybindings(bufnr)
  require("which-key").register({
    ["<localleader>"] = {
      r = { "<cmd>lua require'crates'.open_repository()<cr>", "Open repository" },
      p = { "<cmd>lua require'crates'.show_popup()<cr>", "Show popup" },
      c = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "Show info" },
      f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "Show features" },
      d = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "Show dependencies" },
    },
  }, { buffer = bufnr, mode = "n" })
end

return M
