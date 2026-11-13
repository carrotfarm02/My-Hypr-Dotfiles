BRIGHTNESS=$(brightnessctl get brightness)

if [[ $BRIGHTNESS -le 4800 ]]; then 	# if brightness is under 5% (inclusive),
    brightnessctl set 1%-		# it will go down by 1%
elif [[ $BRIGHTNESS -gt 38400 ]]; then  # or if it's above 40% (exclusive)
    brightnessctl set 10%-		# it'll be 10%
else 
    brightnessctl set 5%-		# as opposed to 5% otherwise.
fi
