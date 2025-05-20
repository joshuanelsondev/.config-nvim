local jdtls = require('jdtls')

local home = os.getenv("HOME")

local config = {
  cmd = {
    'java',

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', '/opt/homebrew/Cellar/jdtls/1.47.0/libexec/plugins/org.eclipse.equinox.launcher_1.7.0.v20250424-1814.jar',

    '-configuration', '/opt/homebrew/Cellar/jdtls/1.47.0/libexec/config_mac',

    '-data', home .. '/.local/share/eclipse/nvim-jdtls-workspace'
  },

  root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),

  settings = {
    java = {}
  },

  init_options = {
    bundles = {}
  },
}

jdtls.start_or_attach(config)
