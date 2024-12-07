local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or specify the path if not globally installed
  filetypes = {
    "javascript", "typescript", "javascriptreact", "typescriptreact",
    "css", "html", "json", "yaml", "markdown",
  },
  cli_options = {
    arrow_parens = "always",
    bracket_spacing = true,
    single_quote = false,
    semi = true,
    tab_width = 2,
    trailing_comma = "es5",
  },
})

-- Auto-command for formatting on save
vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.css,*.html,*.json,*.yaml,*.md Prettier
  augroup END
]], true)

-- Key mapping for manual formatting
vim.api.nvim_set_keymap('n', '<leader>p', ':Prettier<CR>', { noremap = true, silent = true })
