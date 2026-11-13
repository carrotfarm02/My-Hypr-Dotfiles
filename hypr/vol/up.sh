MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep "MUTED") ## returns a null if the regexp MUTED isn't found.

if [[ MUTED != "" ]]; then                      ## if muted, unmute.
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
fi

wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.25
