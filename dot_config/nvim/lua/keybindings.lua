local M = {}
local wk = require("which-key")

-- Make navigating between splits more ergonomic
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- And resizing splits
vim.keymap.set('n', '<M-h>', '<C-w><')
vim.keymap.set('n', '<M-j>', '<C-w>+')
vim.keymap.set('n', '<M-k>', '<C-w>-')
vim.keymap.set('n', '<M-l>', '<C-w>>')

-- Move text up and down
-- Visual --
vim.keymap.set("v", "<A-j>", ":m .+1<cr>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m .-2<cr>==", { noremap = true, silent = true })
-- Visual Block --
vim.keymap.set("x", "<A-j>", ":move '>+1<cr>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<cr>gv-gv", { noremap = true, silent = true })

-- Put and delete without saving text
vim.keymap.set("v", "<leader>p", "\"_dP", { silent = true })
vim.keymap.set("v", "<leader>d", "\"_d", { silent = true })

-- Auto indent the whole file
vim.keymap.set("n", "<leader>=", "gg=G<C-o>", { noremap = true, silent = true })

-- (Basically) How fast which_key opens
vim.o.timeoutlen = 750

----- KEYBINDINGS -----
wk.register({
  ["<leader>"] = {
    [';'] = { "<cmd>Alpha<cr>", "Alpha" },
    ['='] = { "Auto indent file" },
    c = { "<cmd>bd<cr>", "Close buffer" },
    e = { "<cmd>NvimTreeToggle<cr>", "File explorer" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    h = { "<cmd>nohlsearch<cr>", "No highlight" },
    j = { "<cmd>bnext<cr>", "Next buffer" },
    k = { "<cmd>bprev<cr>", "Previous buffer" },
    p = { "<cmd>Telescope git_files<cr>", "Search project files" },
    w = { "<cmd>write<cr>", "Write" },
    q = { "<cmd>quitall<cr>", "Quit all" },
    z = { "<cmd>ZenMode<cr>", "Zen mode" },
    Q = { "<cmd>quitall!<cr>", "Quit all without saving" },
    W = { "<cmd>set eventignore+=BufWritePre | w | set eventignore-=BufWritePre<cr>", "Write without formatting" },
    b = {
      name = "Buffers",
      b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
      e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close", },
      f = { "<cmd>Telescope buffers <cr>", "Find" },
      h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
      l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right", },
      n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
      p = { "<cmd>BufferLineTogglePin<cr>", "Toggle Pin" },
      s = { "<cmd>BufferLinePick<cr>", "Leap" },
      D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory", },
      L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language", },
    },
    d = {
      name = "Debug",
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get session" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
      p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle REPL" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
      C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to cursor" },
      U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
    },
    g = {
      name = "Git",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git diff", },
      j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset hunk" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage hunk" },
      u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo stage hunk", },
      C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit for current file", },
      L = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle line blame", },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset buffer" },
    },
    n = {
      name = "Neorg",
      i = { "<cmd>Neorg index<cr>", "Open index" },
      j = { "<cmd>Neorg journal<cr>", "Journal" },
      n = { "<cmd> Neorg workspace notes<cr>", "Open notes" },
      t = { "<cmd>Neorg journal today<cr>", "Today's journal" },
    },
    r = {
      name = "Run Code Snippet",
      c = { "<cmd>SnipClose<cr>", "Close SnipRun output" },
      i = { "<cmd>SnipInfo<cr>", "SnipRun info" },
      l = { "<cmd>SnipRun<cr>", "Run current line" },
      r = { "<plug>SnipRunOperator", "Run snippet" },
      R = { "<cmd>SnipReset<cr>", "Reset SnipRun" },
    },
    s = {
      name = "Search",
      b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer text" },
      f = { "<cmd>Telescope find_files<cr>", "File" },
      g = { "<cmd>Telescope live_grep<cr>", "Text" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      l = { "<cmd>Telescope resume<cr>", "Resume last search" },
      p = { "<cmd>Telescope git_files<cr>", "Project files", },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
      t = { "<cmd>Telescope<cr>", "Telescope" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
      H = { "<cmd>Telescope highlights<cr>", "Highlight groups" },
      M = { "<cmd>Telescope man_pages<cr>", "Man pages" },
      P = { "<cmd>Telescope projects<cr>", "Projects" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
    },
    L = {
      name = "LaTeX",
      L = { "<cmd>lua require('nabla').popup()<cr>", "Preview popup" },
      d = { "<cmd>lua require('nabla').disable_virt()<cr>", "Disable for buffer" },
      e = { "<cmd>lua require('nabla').enable_virt()<cr>", "Enable for buffer" },
      l = { "<cmd>lua require('nabla').toggle_virt()<cr>", "Toggle for buffer" },
    },
  }
})

----- VISUAL MODE BINDINGS ------
wk.register({
  ["<leader>"] = {
    d = { "Delete without yanking" },
    p = { "Paste over without yanking" },
    r = { "Run selected code" },
  },
}, { mode = "v" })
-- Doesn't work directly with which-key, in any way I can figure out
vim.keymap.set("v", "<leader>r", ":'<,'>SnipRun<cr>", { noremap = true, silent = true })

----- BUFFER SPECIFIC BINDINGS -----
-- Set up LSP Keybindings
function M.lsp_keybindings(bufnr)
  wk.register({
    g = {
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "List implementations" },
      r = { "<cmd>lua vim.lsp.buf.references()<cr>", "List references" },
    },
    K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover info" },
    ["<leader>"] = {
      a = { "<cmd>CodeActionMenu<cr>", "Code actions" },
      l = {
        name = "LSP",
        a = { "<cmd>CodeActionMenu<cr>", "Code action" },
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer diagnostics" },
        e = { "<cmd>Telescope quickfix<cr>", "Telescope quickfix" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature help" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic", },
        k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev diagnostic", },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens action" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go to type definition" },
        w = {
          name = "Workspace",
          d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
          a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace folder" },
          r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace folder" },
          l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List workspace folders" },
          s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace symbols", },
        },
        I = { "<cmd>NullLsInfo<cr>", "Null-LS info" },
        K = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostics float" },
        S = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
      },
    },
  }, { buffer = bufnr, mode = "n" })
end

-- Set up rust specific keybindings
function M.rust_keybindings(bufnr)
  wk.register({
    K = { "<cmd>lua require('rust-tools').hover_actions.hover_actions", "Rust Hover" },
    ["<localleader>"] = {
      name = "Rust",
      a = { "<cmd>RustLsp hover action<cr>", "Code action group" },
      c = { "<cmd>RustLsp openCargo<cr>", "Open cargo.toml" },
      f = { "<cmd>RustLsp flyCheck<cr>", "Fly check/clippy" },
      h = { "<cmd>RustLsp hover range<cr>", "Code action group" },
      j = { "<cmd>RustLsp moveItem down<cr>", "Move item up" },
      k = { "<cmd>RustLsp moveItem up<cr>", "Move item down" },
      m = { "<cmd>RustLsp expandMacro<cr>", "Expand macro" },
      p = { "<cmd>RustLsp parentModule<cr>", "Parent module" },
      r = { "<cmd>RustLsp runnables<cr>", "Runnables" },
      s = { "<cmd>RustLsp syntaxTree<cr>", "View syntax tree" },
      v = { "<cmd>RustLsp crateGraph<cr>", "Create graph" },
    },
  }, { buffer = bufnr, mode = "n" })
end

-- Cargo.toml keybindings
function M.crate_keybindings(bufnr)
  wk.register({
    ["<localleader>"] = {
      r = { "<cmd>lua require'crates'.open_repository()<cr>", "Open repository" },
      p = { "<cmd>lua require'crates'.show_popup()<cr>", "Show popup" },
      c = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "Show info" },
      f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "Show features" },
      d = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "Show dependencies" },
    },
  }, { buffer = bufnr, mode = "n" })
end

-- C/C++ keybindings
function M.clangd_keybindings(bufnr)
  wk.register({
    ["<localleader>"] = {
      s = { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch to source/header" },
    },
  }, { buffer = bufnr, mode = "n" })
end

-- Norg keybinds
function M.norg_keybindings(bufnr)
  wk.register({
    ["<localleader>"] = {
      i = { "+Insert" },
      l = { "+List" },
      m = { "+Mode" },
      n = { "+Notes" },
      t = { "+Tasks" },
      c = { "<cmd>Neorg toggle-concealer<cr>", "Toggle concealer" },
      r = { "<cmd>Neorg exec cursor<cr>", "Run code block" },
      I = { "<cmd>Neorg inject-metadata<cr>", "Inject metadata" },
      R = { "<cmd>Neorg exec current-file<cr>", "Run all code blocks" },
      d = {
        name = "Toggle linters/diagnostics",
        d = {
          "<cmd>lua require('null-ls').toggle('alex');\z
          require('null-ls').toggle('proselint');\z
          require('null-ls').toggle('write_good')<cr>",
          "Toggle all"
        },
        a = { "<cmd>lua require('null-ls').toggle('alex')<cr>", "Toggle Alex" },
        p = { "<cmd>lua require('null-ls').toggle('proselint')<cr>", "Toggle proselint" },
        w = { "<cmd>lua require('null-ls').toggle('write_good')<cr>", "Toggle write-good" },
      }
    }
  }, { buffer = bufnr, mode = "n" })
end

return M
