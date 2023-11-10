HOTKEY = hs.hotkey
HYPER = { "shift", "command", "control", "option" } -- Karabinier maps this as: Caps_Lock


-- Reload config automatically
local configFileWatcher
function reloadConfig()
   configFileWatcher:stop()
   configFileWatcher = nil
   hs.reload()
end


configFileWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.config/hammerspoon/", reloadConfig)
configFileWatcher:start()


-- Load local modules
require("gpt-grammarly")

-- Load Spoons

-- Finally, show a notification that we finished loading the config
hs.notify.new({
   title = 'Hammerspoon',
   subTitle = 'Configuration loaded'
}):send()


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", hs.reload)