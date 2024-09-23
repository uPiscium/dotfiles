return {
  {
    "williamboman/mason.nvim",
    init = function()
      require('mason').setup{
        ui = {
          icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      }
    end,
    -- config = function()
    --   require'lspconfig'.tinymist.setup{
    --     settings = {
    --       exportPdf = "onType"
    --     }
    --   }
    --   require'lspconfig'.glslx.setup{
    --     settings = {
    --     }
    --   }
    -- end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
}
