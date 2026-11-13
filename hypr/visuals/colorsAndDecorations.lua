
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,

        border_size = 5,

        col = {
            active_border = { colors = {"rgba(e01017aa)", "rgba(d910e0aa)"}, angle = 45},
            inactive_border = "rgba(d910e070)",
        },

        resize_on_border = true,

        allow_tearing = false,

        layout = "dwindle",
    },

--    plugin = {
--        gloview = {
--            blur = 0.1,
--            preview_round = 12,
--            strip_gap = 48,
--            hover_border = 0xFF90DBCB,
--            select_border = 0xFF9090CC,
--            backdrop_color = 0xff405080,
--            show_all_workspaces = true,
--            show_workspace_labels = false,
--
--            key_close_window = "q"
--        }
--    },


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
