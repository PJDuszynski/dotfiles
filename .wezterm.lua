local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.font_size = 10.0
config.wsl_domains = {
    {
        name = 'WSL:Fedoraremix',
        distribution = 'fedoraremix',
        default_cwd = "/home/pduszynski",
    }
}
config.default_domain = "WSL:Fedoraremix"
return config
