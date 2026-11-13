MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep "MUTED")

if [[ MUTED != "" ]]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
fi

wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.25

