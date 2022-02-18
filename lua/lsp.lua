require'lspconfig'.pyright.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('pyright', {container_runtime = "podman",}),
  root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd()),
  ...
}


require'lspconfig'.omnisharp.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('omnisharp', {container_runtime = "podman",}),
  on_new_config = function(new_config, new_root_dir)
  if new_root_dir then
      table.insert(new_config.cmd, '//usr/run')
      table.insert(new_config.cmd, '--languageserver')
      table.insert(new_config.cmd, '-s')
      table.insert(new_config.cmd, new_root_dir)
    end
  end,
  root_dir = require'lspconfig'.util.root_pattern("*.sln", "*.csproj", vim.fn.getcwd()),
  ...
}
