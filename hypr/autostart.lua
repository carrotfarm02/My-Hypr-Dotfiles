hl.on("hyprland.start", function()
    hl.exec_cmd(terminal)
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpm reload")
end)

-- hl.on("hyprland.start", function() 	-- there's probably a more elegant way to do this but
--     hl.timer(function()			-- runs commands after delay from hyprland.start
-- no command currently needed here, but now you know! (they would go where this text is btw)
--     end, {timeout = 30, type = "oneshot"})
-- end)
