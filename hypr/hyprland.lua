-- welcome to the master file!
-- feel free to change this as you like,
-- this is basically a modification of the default config hyprland has
-- but it might be easier for someone who wants to get more technical
-- with hyprland to start here. (I'm not that great though).

-- set the programs that you use
terminal = "kitty"
browser = "vivaldi"
fileManager = "dolphin"
menu = "rofi -show drun"
windSwitch = "rofi -show window"

-- autostart necessary processes (like notifications daemons, status bars, etc.)
require("autostart")

-- things like cursor size, and other environment variables.
require("enviVars")

-- window rules (these window rules make overlays still have blur on them)
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "rofi" },blur = true, ignore_alpha = 0.5 })

-- visuals! this one is stuff like the blurring, and window borders/spacing.
require("visuals/colorsAndDecorations")

-- visuals also! this one's animations.
require("visuals/animations")

-- mouse/keyboard/monitor in here
require("input")

-- keybinds (well, duh.)
require("keybinds")

-- windows and workspaces 
require("windowLayouts")


-- aaaand that's it!
