hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.on("hyprland.start", function()
    hl.exec_cmd("XDG_MENU_PREFIX=arch- kbuildsycoca6")
end)

-- fix scaling under Xwayland

hl.config({ xwayland = { force_zero_scaling = true }})
