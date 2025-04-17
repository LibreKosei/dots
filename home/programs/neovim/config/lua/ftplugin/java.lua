local config = {
    cmd = {'jdt-language-server'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', 'git', 'mvnw'}, { upward = true })[1])
}

require('jdt-language-server').start_or_attach(config)
