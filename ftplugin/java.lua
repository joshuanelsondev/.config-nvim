-- ~/.config/nvim/ftplugin/java.lua

-- Ensure lspconfig is loaded
local lspconfig = require('lspconfig')
-- Ensure nvim-cmp's capabilities are used for LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Path to Mason's jdtls installation directory
local mason_packages_path = vim.fn.stdpath "data" .. "/mason/packages/jdtls"
local jdtls_executable = mason_packages_path .. "/bin/jdtls"

-- IMPORTANT: You need to download lombok.jar from https://projectlombok.org/
-- and place it inside Mason's jdtls installation directory.
-- For simplicity, let's assume it's directly in the jdtls package directory:
-- ~/.local/share/nvim/mason/packages/jdtls/lombok.jar
local lombok_path = mason_packages_path .. "/lombok.jar"

-- Function to get the root directory of the Java project
-- This is crucial for jdtls to understand your project structure (Maven, Gradle, etc.)
local root_dir = function(fname)
    local util = lspconfig.util
    -- Check for Maven or Gradle project files, or a Git repo
    return util.root_pattern("pom.xml", "build.gradle", "settings.gradle", ".classpath", ".project", ".git")(fname)
end

-- Define a function that will be called when the LSP server attaches to a buffer
-- This is where you put buffer-local keymaps and completion source setup
local on_attach = function(client, bufnr)
    -- Enable completion (if using nvim-cmp)
    require('cmp').setup.buffer({
        sources = {
            { name = 'nvim_lsp' },
            { name = 'path' },
            { name = 'buffer' },
        }
    })

    -- Set up basic keymaps for LSP actions specific to this buffer
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

    -- You can add other configurations here that should happen after the client attaches
    print("LSP client for Java attached to buffer " .. bufnr .. "!")
end

-- Configure jdtls
-- This setup will be called every time a .java file is opened.
-- lspconfig is smart enough to not start multiple servers for the same root_dir.
lspconfig.jdtls.setup {
    on_attach = on_attach,
    root_dir = root_dir,
    -- 'cmd' is where you explicitly define how to launch jdtls
    cmd = {
        'java',
        -- Ensure you are using a compatible JDK (e.g., Java 17 or newer)
        -- You might need to specify the full path to your Java executable here if your default 'java' is too old
        -- Example: '/usr/lib/jvm/java-17-openjdk/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1G', -- Minimum heap size
        '-Xmx4G', -- Maximum heap size for jdtls (adjust based on your RAM and project size)
        '-javaagent:' .. lombok_path, -- IMPORTANT: This line enables Lombok support
        '-jar', jdtls_executable, -- The actual jdtls launcher jar provided by Mason
        -- Arguments for the jdtls launcher itself
        '-configuration', mason_packages_path .. '/config_linux', -- Path to jdtls config dir (adjust for mac/windows if necessary)
        -- Use vim.fs.basename to get the directory name for the workspace path
        '-data', vim.fn.stdpath('cache') .. '/jdtls-workspace/' .. vim.fs.basename(vim.fn.getcwd()),
    },

    -- JVM arguments and settings for jdtls
    settings = {
        java = {
            format = {
                enabled = true,
                settings = {
                    url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
                    profile = "GoogleStyle", -- Or "Eclipse" etc.
                }
            },
            inlayHints = {
                parameterNames = {
                    enabled = "all"
                }
            },
            foldingRange = {
                enabled = true
            },
            signatures = {
                enabled = true
            },
            references = {
                onlyReturns = true
            },
            saveActions = {
                organizeImports = true,
            },
            configuration = {
                maven = {}, -- Default settings are often fine
                gradle = {
                    enabled = true,
                    wrapper = { enabled = true },
                    buildScripts = { reconcile = { enabled = true } }
                },
            },
        },
    },

    capabilities = capabilities,

    -- Custom initialization options for jdtls
    init_options = {
        bundles = {}, -- Add additional jdtls bundles here if needed
        -- Use vim.fs.basename for the workspace path in init_options as well
        workspace = vim.fn.stdpath('cache') .. '/jdtls-workspace/' .. vim.fs.basename(vim.fn.getcwd()),
    },
}

-- Ensure that the JDTLS workspace directory exists
-- Use vim.fs.basename for the mkdir path
vim.fn.mkdir(vim.fn.stdpath('cache') .. '/jdtls-workspace/' .. vim.fs.basename(vim.fn.getcwd()), 'p')
