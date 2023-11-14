local status, neotree = pcall(require, "neo-tree")
if (not status) then return end

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

neotree.setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  window = {
    width = 30,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<Space>e"] = "close_window",
      ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
      ["l"] = "open_with_window_picker",
      ["h"] = "close_node"
    }
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
        ".git",
        ".cache",
        ".DS_Store",
      },
      follow_current_file = {
        enabled = true,
      }
    }
  }
})
