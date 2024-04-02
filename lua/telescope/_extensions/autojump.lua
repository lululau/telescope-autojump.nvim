return require("telescope").register_extension {
  setup = function(ext_config, config)
    -- access extension config and user config
  end,
  exports = {
    autojump = require("telescope_autojump").autojump
  },
}
