local keymap = vim.keymap

-- builtin
keymap.set("i", "hj", "<ESC>", { noremap = true, silent = true })
keymap.set("i", "<C-b>", "<ESC>", { noremap = true, silent = true })
keymap.set("n", "j", "gj", { noremap = true, silent = true })
keymap.set("n", "k", "gk", { noremap = true, silent = true })
keymap.set("v", "j", "gj", { noremap = true, silent = true })
keymap.set("v", "k", "gk", { noremap = true, silent = true })
keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true })
keymap.set("t", "<C-[>", "<C-\\><C-n>", { noremap = true, silent = true })
keymap.set("n", "<C-b>h", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-b><C-h>", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-b>l", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-b><C-l>", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-b>d", "<cmd>BufferDelete<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-b><C-d>", "<cmd>BufferClose<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- plugins
-- Neo-tree
keymap.set("n", "<Space>e", "<cmd>Neotree<CR>", { noremap = true, silent = true })
-- ohters in neo-tree.lua

-- telescope
keymap.set("n", "<Space>g", "<cmd>Telescope git_files<CR>", { noremap = true, silent = true })
keymap.set("n", "<Space>f", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
keymap.set("n", "<Space>o", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true })
keymap.set("n", "<Space>r", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

-- lightspeed
keymap.set("n", "s", "<Plug>Lightspeed_s", { noremap = true, silent = true })

-- coc
keymap.set("i", "<C-Space>", "coc#refresh()", { expr = true, silent = true })    -- trigger completion
keymap.set("n", "<Leader>rn", "<Plug>(coc-rename)", { silent = true })           -- rename
keymap.set("n", "<Leader>fm", "<Plug>(coc-format)", { silent = true })           -- format
keymap.set("n", "<Leader>c", "<Plug>(coc-codeaction-cursor)", { silent = true }) -- code action
keymap.set("n", "<Leader>a", "<Plug>(coc-codeaction)", { silent = true })        -- code action
keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })               -- references
keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })               -- go to definition
keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })          -- go to type definition
keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })          -- go to previous diagnostic
keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })          -- go to next diagnostic

-- markdown-preview
keymap.set("n", "<C-m>d", "<Plug>MarkdownPreviewToggle", { noremap = false, silent = true })

-- toggleterm
keymap.set("n", "<Space>tv", "<cmd>ToggleTerm direction=vertical size=100<CR>", { noremap = true, silent = true })
keymap.set("n", "<Space>th", "<cmd>ToggleTerm direction=horizontal size=12<CR>", { noremap = true, silent = true })
keymap.set("n", "<Space>tf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })
keymap.set("n", "<Space>tt", "<cmd>lua tig_toggle()<CR>", { noremap = true, silent = true })
keymap.set("t", "<C-n>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })

-- camel-case-motion
keymap.set("n", "w", "<Plug>CamelCaseMotion_w", { noremap = true, silent = true })
keymap.set("n", "b", "<Plug>CamelCaseMotion_b", { noremap = true, silent = true })
keymap.set("n", "e", "<Plug>CamelCaseMotion_e", { noremap = true, silent = true })
keymap.set("n", "vw", "v<Plug>CamelCaseMotion_iw", { noremap = true, silent = true })
keymap.set("n", "vb", "v<Plug>CamelCaseMotion_ib", { noremap = true, silent = true })
keymap.set("n", "ve", "v<Plug>CamelCaseMotion_ie", { noremap = true, silent = true })
keymap.set("n", "dw", "d<Plug>CamelCaseMotion_w", { noremap = true, silent = true })
keymap.set("n", "db", "d<Plug>CamelCaseMotion_b", { noremap = true, silent = true })
keymap.set("n", "de", "d<Plug>CamelCaseMotion_e", { noremap = true, silent = true })

-- nvim-dap
local status, dap = pcall(require, "dap")
if status then
  keymap.set("n", "<F5>", function()
    dap.continue()
  end)
  keymap.set("n", "<F10>", function()
    dap.step_over()
  end)
  keymap.set("n", "<F11>", function()
    dap.step_into()
  end)
  keymap.set("n", "<F12>", function()
    dap.step_out()
  end)
  keymap.set("n", "<Leader>b", function()
    dap.toggle_breakpoint()
  end)
  keymap.set("n", "<Leader>B", function()
    dap.set_breakpoint()
  end)
  keymap.set("n", "<Leader>lp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  end)
  keymap.set("n", "<Leader>dr", function()
    dap.repl.open()
  end)
  keymap.set("n", "<Leader>dl", function()
    dap.run_last()
  end)
  keymap.set({ "n", "v" }, "<Leader>dh", function()
    require("dap.ui.widgets").hover()
  end)
  keymap.set({ "n", "v" }, "<Leader>dp", function()
    require("dap.ui.widgets").preview()
  end)
  keymap.set("n", "<Leader>df", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
  end)
  keymap.set("n", "<Leader>ds", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
  end)
end
