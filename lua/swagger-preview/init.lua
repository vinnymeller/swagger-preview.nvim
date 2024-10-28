local M = {}

function M.setup(config)
  M.port = config.port or 8000
  M.host = config.host or "localhost"
end

M.server_on = false
M.file_being_previewed = nil

function M.start_server()
  local plugin_path = debug.getinfo(1, "S").source:sub(2) -- Get the full file path
  local plugin_dir = vim.fn.fnamemodify(plugin_path, ":h") -- Get the directory path
  local swagger_ui_watcher_path = vim.fn.fnamemodify(plugin_dir, ":h:h") .. "/node_modules/.bin/swagger-ui-watcher"

  local swagger_path = vim.fn.expand "%:p"

  if swagger_path == M.file_being_previewed then
    return
  end

  if M.server_on then
    M.stop_server()
  end

  local cmd = swagger_ui_watcher_path .. " -p " .. M.port .. " -h " .. M.host .. " " .. swagger_path

  M.server_pid = vim.fn.jobstart(cmd, {
    on_stdout = function(_, data, _)
      print(vim.inspect(data))
    end,
    on_stderr = function(_, data, _)
      print(vim.inspect(data))
    end,
    on_exit = function(_, code, _)
      print("swagger-ui-watcher exited with code " .. code)
    end,
  })
  M.server_on = true
  M.file_being_previewed = swagger_path
end

function M.stop_server()
  vim.fn.jobstop(M.server_pid)
  M.server_on = false
  M.file_being_previewed = nil
end

function M.toggle_server()
  if M.server_on then
    M.stop_server()
    M.server_on = false
  else
    M.start_server()
    M.server_on = true
  end
end

-- define a command to call the start server function,
vim.api.nvim_create_user_command("SwaggerPreview", "lua require('swagger-preview').start_server()", {})
vim.api.nvim_create_user_command("SwaggerPreviewStop", "lua require('swagger-preview').stop_server()", {})
vim.api.nvim_create_user_command("SwaggerPreviewToggle", "lua require('swagger-preview').toggle_server()", {})

return M
