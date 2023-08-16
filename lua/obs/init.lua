local M = {}

M.open_in_obsidian = function()

  local relative_path = require"obs.utils".get_git_relative_path()
  local vault = require"obs.utils".get_git_root_folder()
  -- !open "obsidian://open?vault=notes&file=second_brain/resources/the_happy_sleeper"
  -- temp path
  -- relative_path = "second_brain/resources/the_happy_sleeper.md"

  if vim.fn.has("mac") then
    local cmd = "silent !open \"obsidian://open?vault=" .. vault .. "&file=" .. relative_path .. "\"&> /tmp/open.log"
  elseif vim.fn.has("linux") then
    local cmd = "silent !xdg-open \"obsidian://open?vault=" .. vault .. "&file=" .. relative_path .. "\"&> /tmp/xdg_open.log"
  end
  vim.api.nvim_command(cmd)
end

-- M.setup({ vault = "notes" })
-- M.open_in_obsidian()

return M


