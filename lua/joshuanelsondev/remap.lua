
local opts = { noremap = true, silent = true }

-- Normal mode mappings
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', opts)
vim.keymap.set('n', '<C-t>', ':Files!<CR>', opts)
vim.keymap.set('n', '<C-p>', ':GFiles!<CR>', opts)
vim.keymap.set('n', '<C-g>', ':Ag<CR>', opts)
vim.keymap.set('n', '<leader><CR>', ':w<CR>', opts)
vim.keymap.set('n', '<leader>so', ':s/', opts)
vim.keymap.set('n', '<leader>so', ':s/', opts)
vim.keymap.set('n', '<leader>sa', ':%s/', opts)
vim.keymap.set('n', '<leader>sp', ':set path+=**<CR>', opts)
vim.keymap.set('n', '<leader>x', ':%d<CR>', opts)
vim.keymap.set('n', '<leader>t', ':term<CR>', opts)
vim.keymap.set('n', '<leader>q', ':q<CR>', opts)
vim.keymap.set('n', '<leader>w', ':wq<CR>', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)
vim.keymap.set('n', '<leader>v', ':vert split<CR>', opts)
vim.keymap.set('n', '<leader>1', '`1', opts)
vim.keymap.set('n', '<leader>2', '`2', opts)
vim.keymap.set('n', '<leader>3', '`3', opts)
vim.keymap.set('n', '<leader>4', '`4', opts)
vim.keymap.set('n', '<leader>5', '`5', opts)
vim.keymap.set('n', '<leader>6', '`6', opts)
vim.keymap.set('n', '<leader>7', '`7', opts)
vim.keymap.set('n', '<leader>8', '`8', opts)
vim.keymap.set('n', '<leader>dm', ':delm', opts)
vim.keymap.set('n', '<leader>m', ':marks<CR>', opts)

-- Markdown Preview mappings (remapped to <leader>m>)
--vim.keymap.set('n', '<leader>ms', '<Plug>MarkdownPreview', opts)
--vim.keymap.set('n', '<leader>me', '<Plug>MarkdownPreviewStop', opts)
--vim.keymap.set('n', '<leader>mt', '<Plug>MarkdownPreviewToggle', opts)

-- Insert mode mappings
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
vim.keymap.set('i', 'jk', '<Esc>', opts)

-- Visual mode mappings
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- General mappings
vim.keymap.set('', '<Tab>', '<Esc>', opts)

-- Spanish Accents (Alt/Option + Key)
local spanish_chars = {
    ['a'] = 'á', ['e'] = 'é', ['i'] = 'í', ['o'] = 'ó', ['u'] = 'ú',
    ['n'] = 'ñ', ['u:'] = 'ü',
    ['A'] = 'Á', ['E'] = 'É', ['I'] = 'Í', ['O'] = 'Ó', ['U'] = 'Ú',
    ['N'] = 'Ñ', ['U:'] = 'Ü',
    ['!'] = '¡', ['?'] = '¿'
}

for key, val in pairs(spanish_chars) do
    vim.keymap.set('i', ',,' .. key .. '>', val, opts)
end
