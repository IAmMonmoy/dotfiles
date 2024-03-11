local M = {}

local function directory_exists(path)
  local f = io.popen("cd " .. path)

  if f == nil then
    return false
  end

  local ff = f:read "*all"

  if ff:find "ItemNotFoundException" then
    return false
  else
    return true
  end
end

M.directory_exists = function(workspace_dir)
  if directory_exists(workspace_dir) then
  else
    os.execute("mkdir " .. workspace_dir)
  end
end

M.common_capabilities = function()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capability = vim.lsp.protocol.make_client_capabilities()
  capability.textDocument.completion.completionItem.snippetSupport = true
  capability.textDocument.completion.completionItem.resolveSupport = {
    properties = {

      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return capability
end

return M
