------------------
---- MONITORS ----
------------------

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1.2,
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local browser = "vivaldi"
local fileManager = "dolphin"
local menu = "rofi -show drun"
local windSwitch = "rofi -show window"

-------------------
---- AUTOSTART ----
-------------------

hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
    -- hl.exec_cmd(terminal)
    hl.exec_cmd("dunst")
    hl.exec_cmd("nm-applet") 
    hl.exec_cmd("hyprpaper & waybar")
    hl.exec_cmd("hyprpm reload")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.on("hyprland.start", function()
    hl.exec_cmd("XDG_MENU_PREFIX=arch- kbuildsycoca6")
end)

-- fix scaling under Xwayland

hl.config({ xwayland = { force_zero_scaling = true }})

----------------------
---- WINDOW RULES ----
----------------------

hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "rofi" },blur = true, ignore_alpha = 0.5 })


-----------------------
----- PERMISSIONS -----
-----------------------

-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--    },
-- })

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,

        border_size = 5,
 
        col = {
            active_border = { colors = {"rgba(e01017aa)", "rgba(d910e0aa)"}, angle = 45},
            inactive_border = "rgba(d910e070)",
        },

        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
    
        layout = "dwindle",
    },

    plugin = {
        -- gloview = {
            -- blur = 0.8,
            -- preview_round = 12,

	        -- strip_active_border_size = 2,
            -- close_button_color = 0xFFFF0000,
	        -- strip_active_border = 0xFFFF55AA,

            -- hover_border = 0xDDFF55AA,
            -- select_border = 0xDDCC8899,
            -- backdrop_color = 0x80FFDDFF,

            -- exit_on_click = 0,
            -- strip_gap = 48,
	        -- show_empty = 0,
            -- show_all_workspaces = true,
            -- show_workspace_labels = false,

	        -- key_activate = "space",            
            -- key_close_window = "q"
        },
    },


    decoration = {
        rounding = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows

        active_opacity = 1.0,
        inactive_opacity = .85,
    

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = 0x1a1a1aee,
        },

        blur = {
            enabled = true,
            size = 5,
            passes = 2,
            vibrancy = 0.5,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

hl.config({
    dwindle = {
        preserve_split = true -- You probably want this
    },

    master = {
        new_status = slave
    },
    
    scrolling = {
        fullscreen_on_one_column = true
    },

    misc = {
        force_default_wallpaper = 1, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true -- If true disables the random hyprland logo / anime girl background. 
    },
})

---------------
---- INPUT ----
---------------

hl.config ({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = .2, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

--hl.gesture({
--    fingers = 2,
--    direction = "pinchin",
--    action = {
--        start = function(e) hl.plugin.gloview.open end
--    }
--})

-- Example per-device config
-- hl.device({
--     name = "epic-mouse-v1"
--     sensitivity = 0,
-- })

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()), 
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
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s -q +5")
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s -q 5-")

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + W", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"}))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }) )
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }) )

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true } )
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true } )

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Window Switch
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(windSwitch))

-- gloview, uncomment if you have installed the plugin (hyprpm install https://github.com/fedsfarm/gloview && hyprpm enable gloview)
-- hl.bind(mainMod .. " + Y", hl.plugin.gloview.toggle)

-- hl.gesture({ 
--    fingers = 3, 
--    direction = "up", 
--    action = hl.plugin.gloview.open
-- })
-- hl.gesture({
--    fingers = 3,
--    direction = "down",
--    action = hl.plugin.gloview.close
-- })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.workspace_rule({ workspace = "1", layout = "master"})
hl.workspace_rule({ workspace = "2", layout = "monocle"})
hl.workspace_rule({ workspace = "3", layout = "scrolling"})
hl.workspace_rule({ workspace = "special:magic", layout = "scrolling"})

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
