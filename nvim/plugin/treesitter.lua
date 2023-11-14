local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

ts.setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "graphql",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "python",
    "regex",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "yaml",
    "markdown",
    "cmake",
    "xml",
    "git_config",
    "gitcommit",
    "gitignore",
    "jsdoc",
    "latex",
    "markdown",
    "markdown_inline",
    "diff",
    "vimdoc",
  },
  highlight = {
    enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = { "letex", "markdown" },
  },
  indent = {
    enable = true,
  },
  tree_docs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },
})
