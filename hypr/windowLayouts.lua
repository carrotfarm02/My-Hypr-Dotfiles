hl.config({
    dwindle = {
        preserve_split = true -- You probably want this
    },

-- See https://wiki.hypr.land/Configuring/Master-Layout/ for more
    master = {
        new_status = slave
    },

    scrolling = {
        fullscreen_on_one_column = true
    },

    misc = {
        force_default_wallpaper = 1, 
        disable_hyprland_logo = true -- you want these.
    },
})

-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more window rules
-- See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

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
