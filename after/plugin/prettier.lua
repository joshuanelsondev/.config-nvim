local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or specify the path if not globally installed
  filetypes = {
    "javascript", "typescript", "javascriptreact", "typescriptreact",
    "css", "html", "json", "yaml", "markdown",
  },
  extra_args = {
    "--arrow-parens", "always",
    "--bracket-spacing",
    "--single-quote",
    "--no-semi",
    "--tab-width", "2",
    "--trailing-comma", "es5",
  }
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
