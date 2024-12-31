local M = {}
local wk = require("which-key")

-- (Basically) How fast which_key opens
vim.o.timeoutlen = 750

----- KEYBINDINGS -----
wk.add({
  mode = "n",
  -- Move between splits
  { "<C-h>",   "<C-w>h",         desc = "Move to left split" },
  { "<C-j>",   "<C-w>j",         desc = "Move to lower split" },
  { "<C-k>",   "<C-w>k",         desc = "Move to upper split" },
  { "<C-l>",   "<C-w>l",         desc = "Move to right split" },
  -- Resize splits
  { "<M-h>",   "<C-w><",         desc = "Expand split left" },
  { "<M-j>",   "<C-w>+",         desc = "Expand split down" },
  { "<M-k>",   "<C-w>-",         desc = "Expand split up" },
  { "<M-l>",   "<C-w>>",         desc = "Expand split right" },
  -- Center the cursor when scrolling through pages
  { "<C-u>",   "<C-u>zz" },
  { "<C-d>",   "<C-d>zz" },
  -- Faster tabbing through buffers
  { "<tab>",   "<cmd>bnext<cr>", desc = "Next buffer" },
  { "<s-tab>", "<cmd>bprev<cr>", desc = "Previous buffer" },
  -- LEADER
  {
    "<leader>",
    group = "Leader",
    { "<leader>;", "<cmd>Alpha<cr>",          desc = "Alpha" },
    { "<leader>=", "gg=G<C-o>",               desc = "Auto indent file",           noremap = true, silent = true },
    { "<leader>c", "<cmd>bd<cr>",             desc = "Close buffer" },
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File explorer" },
    { "<leader>h", "<cmd>nohlsearch<cr>",     desc = "No highlight" },
    { "<leader>j", "<cmd>tabnext<cr>",        desc = "Next tab" },
    { "<leader>k", "<cmd>tabprev<cr>",        desc = "Previous tab" },
    { "<leader>p", "<cmd>ProjectRoot<cr>",    desc = "CD to project root" },
    { "<leader>q", "<cmd>quitall<cr>",        desc = "Quit all" },
    { "<leader>w", "<cmd>write<cr>",          desc = "Write" },
    { "<leader>y", "\"+y",                    desc = "Yank into system clipboard", silent = true },
    { "<leader>z", "<cmd>ZenMode<cr>",        desc = "Zen mode" },
    { "<leader>D", "<cmd>DiffOrig<cr>",       desc = "Diff changes in file" },
    { "<leader>F", "<cmd>Format<cr>",         desc = "Format buffer" },
    {
      "<leader>W",
      "<cmd>set eventignore+=BufWritePre | w | set eventignore-=BufWritePre<cr>",
      desc = "Write without formatting"
    },
    -- BUFFERS
    {
      "<leader>b",
      group = "Buffers",
      { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>",       desc = "Previous" },
      { "<leader>be", "<cmd>BufferLinePickClose<cr>",       desc = "Pick which buffer to close", },
      { "<leader>bf", "<cmd>Telescope buffers <cr>",        desc = "Find" },
      { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>",       desc = "Close all to the left" },
      { "<leader>bl", "<cmd>BufferLineCloseRight<cr>",      desc = "Close all to the right", },
      { "<leader>bn", "<cmd>BufferLineCycleNext<cr>",       desc = "Next" },
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>",       desc = "Toggle Pin" },
      { "<leader>bs", "<cmd>BufferLinePick<cr>",            desc = "Leap" },
      { "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory", },
      { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by language", },
    },
    -- DEBUG
    {
      "<leader>d",
      group = "Debug",
      { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>",              desc = "Step back" },
      { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>",               desc = "Continue" },
      { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>",             desc = "Disconnect" },
      { "<leader>dg", "<cmd>lua require'dap'.session()<cr>",                desc = "Get session" },
      { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>",              desc = "Step into" },
      { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>",              desc = "Step over" },
      { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>",                  desc = "Pause" },
      { "<leader>dq", "<cmd>lua require'dap'.close()<cr>",                  desc = "Quit" },
      { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>",            desc = "Toggle REPL" },
      { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>",               desc = "Start" },
      { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>",      desc = "Toggle breakpoint" },
      { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>",               desc = "Step out" },
      { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>",          desc = "Run to cursor" },
      { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI" },
    },
    -- FIND
    {
      "<leader>f",
      group = "Find",
      { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",                                                                        desc = "Current buffer text" },
      { "<leader>fc", "<cmd>Telescope commands<cr>",                                                                                         desc = "Commands" },
      { "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", desc = "File" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",                                                                                        desc = "Text" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",                                                                                        desc = "Help" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>",                                                                                          desc = "Keymaps" },
      { "<leader>fl", "<cmd>Telescope resume<cr>",                                                                                           desc = "Resume last search" },
      { "<leader>fm", "<cmd>Telescope media_files<cr>",                                                                                      desc = "Media files" },
      { "<leader>fp", "<cmd>Telescope git_files<cr>",                                                                                        desc = "Project files", },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                                                                                         desc = "Recent files" },
      { "<leader>ft", "<cmd>Telescope<cr>",                                                                                                  desc = "Telescope" },
      { "<leader>fu", "<cmd>Telescope undo<cr>",                                                                                             desc = "Undo tree" },
      { "<leader>fH", "<cmd>Telescope highlights<cr>",                                                                                       desc = "Highlight groups" },
      { "<leader>fM", "<cmd>Telescope man_pages<cr>",                                                                                        desc = "Man pages" },
      { "<leader>fP", "<cmd>Telescope projects<cr>",                                                                                         desc = "Projects" },
      { "<leader>fR", "<cmd>Telescope registers<cr>",                                                                                        desc = "Registers" },
      { "<leader>fT", "<cmd>TodoTelescope<cr>",                                                                                              desc = "Todo comments" },
    },
    -- GIT
    { "]g", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next git hunk" },
    { "[g", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev git hunk" },
    {
      "<leader>g",
      group = "Git",
      { "<leader>gb", "<cmd>Telescope git_branches<cr>",                                         desc = "Checkout branch" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>",                                          desc = "Checkout commit" },
      { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>",                                         desc = "Git diff", },
      { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next hunk" },
      { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev hunk" },
      { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>",                            desc = "Blame" },
      { "<leader>go", "<cmd>Telescope git_status<cr>",                                           desc = "Open changed file" },
      { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                          desc = "Preview hunk" },
      { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                            desc = "Reset hunk" },
      { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",                            desc = "Stage hunk" },
      { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",                       desc = "Undo stage hunk", },
      { "<leader>gC", "<cmd>Telescope git_bcommits<cr>",                                         desc = "Checkout commit for current file", },
      { "<leader>gD", "<cmd>Gitsigns toggle_word_diff<cr>",                                      desc = "Toggle word diff" },
      { "<leader>gL", "<cmd>Gitsigns toggle_current_line_blame<cr>",                             desc = "Toggle line blame", },
      { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                          desc = "Reset buffer" },
      {
        "<leader>f",
        group = "Find",
        { "<leader>gfb", "<cmd>Telescope git_bcommits<cr>", desc = "Commits for buffer" },
        { "<leader>gfc", "<cmd>Telescope git_commits<cr>",  desc = "Commits" },
        { "<leader>gff", "<cmd>Telescope git_status<cr>",   desc = "Changed files" },
        { "<leader>gfs", "<cmd>Telescope git_stash<cr>",    desc = "Stash" },
        { "<leader>gfB", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
      },
    },
    -- TOGGLES
    {
      "<leader>t",
      group = "Toggles",
      { "<leader>tf", "<cmd>FormatToggle<cr>",  desc = "Toggle format on save" },
      { "<leader>tF", "<cmd>FormatToggle!<cr>", desc = "Toggle format on save for buffer only" },
      {
        "<leader>th",
        function() vim.o.hlsearch = not vim.o.hlsearch end,
        desc = "Toggle hlsearch"
      },
    }
  }
})

----- VISUAL MODE BINDINGS ------
wk.add({
  mode = "v",
  { "<A-j>", ":m .+1<cr>==", desc = "Move selected text up",   noremap = true, silent = true, },
  { "<A-k>", ":m .-2<cr>==", desc = "Move selected text down", noremap = true, silent = true, },
  {
    "<leader>",
    group = "Leader",
    { "<leader>p", "\"_dP", desc = "Paste over without yanking", silent = true, },
    { "<leader>d", "\"_d",  desc = "Delete without yanking",     silent = true, },
    { "<leader>y", "\"+y",  desc = "Yank into system clipboard", silent = true, },
  },
})

wk.add({
  mode = "x",
  noremap = true,
  silent = true,
  { "<A-j>", ":move '>+1<cr>gv-gv", desc = "Move selected text down" },
  { "<A-k>", ":move '<-2<cr>gv-gv", desc = "Move selected text up" },
})


----- INSERT MODE BINDINGS -----
wk.add({
  mode = "i",
  -- Builtin completion hints, see :h ins-completion
  {
    "<C-x>",
    desc = "Builtin completions",
    { "<C-x><C-l>", desc = "Whole lines", },
    { "<C-x><C-n>", desc = "Keywords in current file", },
    { "<C-x><C-k>", desc = "Keywords in dictionary", },
    { "<C-x><C-t>", desc = "Keywords in thesaurus, thesaurus-style", },
    { "<C-x><C-i>", desc = "Keywords in the current and included files", },
    { "<C-x><C-]>", desc = "Tags", },
    { "<C-x><C-f>", desc = "File names", },
    { "<C-x><C-d>", desc = "Definitions or macros", },
    { "<C-x><C-v>", desc = "Vim command-line", },
    { "<C-x><C-u>", desc = "Omni completion", },
    { "<C-x>s",     desc = "Spelling suggestions", },
    { "<C-x><C-z>", desc = "Cancel completion", },
  },
})

----- BUFFER SPECIFIC BINDINGS -----
-- LSP keybindings
function M.lsp_keybindings(bufnr)
  wk.add({
    buffer = bufnr,
    mode = "n",
    {
      "g",
      group = "g(oto)",
      { "gd", "<cmd>Telescope lsp_definitions bufnr=0 theme=get_ivy<cr>",     desc = "Go to definition" },
      { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>",                       desc = "Go to declaration" },
      { "gi", "<cmd>Telescope lsp_implementations bufnr=0 theme=get_ivy<cr>", desc = "List implementations" },
      { "gr", "<cmd>Telescope lsp_references bufnr=0 theme=get_ivy<cr>",      desc = "List references" },
    },
    {
      "<leader>",
      group = "Leader",
      { "<leader>a", function() require("actions-preview").code_actions() end, desc = "Code actions" },
      {
        "<leader>l",
        group = "LSP",
        { "<leader>la", function() require("actions-preview").code_actions() end,        desc = "Code action" },
        { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",          desc = "Buffer diagnostics" },
        { "<leader>le", "<cmd>Telescope quickfix bufnr=0 theme=get_ivy<cr>",             desc = "Telescope quickfix" },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",                             desc = "Format" },
        { "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<cr>",                     desc = "Show signature help" },
        { "<leader>li", "<cmd>LspInfo<cr>",                                              desc = "Info" },
        { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>",                       desc = "Next diagnostic", },
        { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",                       desc = "Prev diagnostic", },
        { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                           desc = "CodeLens action" },
        { "<leader>lr", function() return ":IncRename " .. vim.fn.expand("<cword>") end, desc = "Rename",             expr = true },
        { "<leader>lt", "<cmd>Telescope lsp_type_definitions bufnr=0 theme=get_ivy<cr>", desc = "Type definitions" },
        { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",                       desc = "Document symbols" },
        {
          "<leader>lw",
          group = "Workspace",
          { "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",                       desc = "Add workspace folder" },
          { "<leader>lwd", "<cmd>Telescope diagnostics<cr>",                                        desc = "Diagnostics" },
          { "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List workspace folders" },
          { "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",                    desc = "Remove workspace folder" },
          { "<leader>lws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",                      desc = "Workspace symbols", },
        },
        {
          "<leader>lD",
          function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled({ bufnr }), { bufnr })
          end,
          desc = "Toggle diagnostics",
        },
        { "<leader>lI", "<cmd>NullLsInfo<cr>",                      desc = "Null-LS info" },
        { "<leader>lK", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show diagnostics float" },
      },
    },
  })
end

-- C/C++ keybindings
function M.clangd_keybindings(bufnr)
  wk.add({
    buffer = bufnr,
    mode = "n",
    {
      "<localleader>",
      group = "C/C++",
      { -- These are from Badhi/nvim-treesitter-cpp-tools
        { "<localleader>c", "<cmd>TSCppMakeConcreteClass<cr>", desc = "Create a concrete class" },
        { "<localleader>f", "<cmd>TSCppDefineClassFunc<cr>",   desc = "Implement out-of-class member function" },
        { "<localleader>3", "<cmd>TSCppRuleOf3<cr>",           desc = "Add function declarations for rule of 3" },
        { "<localleader>5", "<cmd>TSCppRuleOf5<cr>",           desc = "Add function declarations for rule of 5" },
      },
      { "<localleader>s", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch to source/header" },
    },
  })
end

-- Cargo.toml keybindings
function M.crate_keybindings(bufnr)
  wk.add({
    buffer = bufnr,
    mode = "n",
    {
      "<localleader>",
      group = "Create",
      { "<localleader>r", "<cmd>lua require'crates'.open_repository()<cr>",         desc = "Open repository" },
      { "<localleader>p", "<cmd>lua require'crates'.show_popup()<cr>",              desc = "Show popup" },
      { "<localleader>c", "<cmd>lua require'crates'.show_crate_popup()<cr>",        desc = "Show info" },
      { "<localleader>f", "<cmd>lua require'crates'.show_features_popup()<cr>",     desc = "Show features" },
      { "<localleader>d", "<cmd>lua require'crates'.show_dependencies_popup()<cr>", desc = "Show dependencies" },
    },
  })
end

-- Rust keybindings
function M.rust_keybindings(bufnr)
  wk.add({
    buffer = bufnr,
    mode = "n",
    { "K", "<cmd>lua require('rust-tools').hover_actions.hover_actions", desc = "Rust Hover" },
    {
      "<localleader>",
      group = "Rust",
      { "<localleader>a", "<cmd>RustLsp hover action<cr>",  desc = "Code action group" },
      { "<localleader>c", "<cmd>RustLsp openCargo<cr>",     desc = "Open cargo.toml" },
      { "<localleader>f", "<cmd>RustLsp flyCheck<cr>",      desc = "Fly check/clippy" },
      { "<localleader>h", "<cmd>RustLsp hover range<cr>",   desc = "Code action group" },
      { "<localleader>j", "<cmd>RustLsp moveItem down<cr>", desc = "Move item up" },
      { "<localleader>k", "<cmd>RustLsp moveItem up<cr>",   desc = "Move item down" },
      { "<localleader>m", "<cmd>RustLsp expandMacro<cr>",   desc = "Expand macro" },
      { "<localleader>p", "<cmd>RustLsp parentModule<cr>",  desc = "Parent module" },
      { "<localleader>r", "<cmd>RustLsp runnables<cr>",     desc = "Runnables" },
      { "<localleader>s", "<cmd>RustLsp syntaxTree<cr>",    desc = "View syntax tree" },
      { "<localleader>v", "<cmd>RustLsp crateGraph<cr>",    desc = "Create graph" },
    },
  })
end

-- Markdown keybinds
function M.markdown_keybindings(bufnr)
  wk.add({
    buffer = bufnr,
    mode = "n",
    { "<localleader>",
      { "<localleader>p", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle preview" },
    }
  }, { buffer = bufnr, mode = "n" })
end

-- TeX keybinds
function M.tex_keybindings(bufnr)
  wk.add({
    buffer = bufnr,
    mode = "n",
    { "<localleader>",
      { "<localleader>p", "<cmd>lua require('nabla').popup()<cr>",        desc = "Preview LaTeX popup" },
      { "<localleader>d", "<cmd>lua require('nabla').disable_virt()<cr>", desc = "Disable LaTeX preview for buffer" },
      { "<localleader>e", "<cmd>lua require('nabla').enable_virt()<cr>",  desc = "Enable LaTeX preview for buffer" },
      { "<localleader>t", "<cmd>lua require('nabla').toggle_virt()<cr>",  desc = "Toggle LaTeX preview for buffer" },
    },
  })
end

return M
