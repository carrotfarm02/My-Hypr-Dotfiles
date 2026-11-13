VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

if [[ $VOLUME = "Volume: 0.00" ]]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
else
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
fi
