vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

    if vim.fn.isdirectory(jdtls_path) == 0 then
      vim.notify("JDTLS not installed. Skipping JDTLS start.", vim.log.levels.WARN)
      return
    end

    local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    if launcher_jar == "" then
      vim.notify("JDTLS launcher .jar not found. Check your installation.", vim.log.levels.ERROR)
      return
    end

    local jdtls = require('jdtls')
    local home = os.getenv("HOME")
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

    local config = {
      cmd = {
        "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home/bin/java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", launcher_jar,
        "-configuration", jdtls_path .. "/config_mac",
        "-data", workspace_dir,
      },
      root_dir = require('jdtls.setup').find_root({".git", "mvnw", "gradlew"}),
      settings = { java = {} },
      init_options = { bundles = {} },
    }

    jdtls.start_or_attach(config)
  end,
})

