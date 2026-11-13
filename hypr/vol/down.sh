VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

if [[ $VOLUME = "Volume: 0.05" ]]; then         ## if the volume is at 5% when pressed
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 1       ## it'll mute it (and stil decrease
fi                                              ## volume by 5%)

wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
