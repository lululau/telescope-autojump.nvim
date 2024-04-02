local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require "telescope.config".values

local script_dir = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
local autojump_script = script_dir .. "autojump.sh"

local autojump = function(opts)
  opts = opts or {}
  pickers.new(opts, {
                prompt_title = "Autojump Files",
                finder = finders.new_oneshot_job(
                  {"bash", autojump_script},
                  opts
                ),
                sorter = conf.generic_sorter(opts),
                attach_mappings = function(prompt_bufnr)
                  actions.select_default:replace(function()
                    local selection = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    vim.cmd("Dired " .. selection.value)
                  end)
                  return true
                end
  }):find()
end

return {
  autojump = autojump
}
