local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local conf = require "telescope.config".values

local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
                prompt_title = "colors",
                finder = finders.new_table {
                  results = { "red", "green", "blue" }
                },
                sorter = conf.generic_sorter(opts),
  }):find()
end

return {
  autojump = colors
}
