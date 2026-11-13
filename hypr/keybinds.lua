---------------------
---- KEYBINDINGS ----
---------------------

local terminal = "kitty"
local browser = "vivaldi"
local fileManager = "dolphin"
local menu = "rofi -show drun"
local windSwitch = "rofi -show window"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Screenshot keybindings
hl.bind("Print", hl.dsp.exec_cmd('grim - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png"'))
hl.bind("CTRL + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png"'))

-- Move focus with mainMod + home row left hand
hl.bind(mainMod .. " + A", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + S", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + D", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + F", hl.dsp.focus({ direction = "right" }))

-- Duplicate of above to add alt option
hl.bind("ALT + A", hl.dsp.focus({ direction = "left" }))
hl.bind("ALT + S", hl.dsp.focus({ direction = "up" }))
hl.bind("ALT + D", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + F", hl.dsp.focus({ direction = "right" }))

-- cycle window focus with I and O (mostly useful for monocle layout)
hl.bind(mainMod .. " + I", hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. " + O", hl.dsp.layout("cyclenext"))

-- Resize Master Layout
hl.bind(mainMod .. " + MINUS", hl.dsp.layout("mfact -0.025"))
hl.bind(mainMod .. " + EQUAL", hl.dsp.layout("mfact +0.025"))

-- Focus the Master window (Master Layout)
hl.bind(mainMod .. " + C", hl.dsp.layout("focusmaster"))

-- Focus the Master window (Master Layout)
hl.bind(mainMod .. " + C", hl.dsp.layout("focusmaster"))

-- Move focused window with mainMod + home row
hl.bind(mainMod .. " + J", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + SEMICOLON", hl.dsp.window.swap({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Brightness (brightnessctl)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/hypr/brightness/up.sh"),        { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/hypr/brightness/down.sh"),     { locked = true, repeating = true })

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + W", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"}))
hl.bind(mainMod .. " + CTRL + T", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle"}))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }) )
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }) )

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true } )
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true } )

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/hypr/vol/up.sh"), 	{ locked = true, repeating = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/hypr/vol/down.sh"), 	{ locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Window Switch
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(windSwitch))

-- gloview
hl.bind(mainMod .. " + Y", hl.plugin.gloview.toggle)

 hl.gesture({ 
     fingers = 3, 
     direction = "up", 
     action = hl.plugin.gloview.open
})
hl.gesture({
    fingers = 3,
    direction = "down",
    action = hl.plugin.gloview.close
})

-- swap workspaces with three-finger swipes.
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

