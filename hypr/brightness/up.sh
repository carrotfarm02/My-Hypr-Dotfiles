BRIGHTNESS=$(brightnessctl get brightness)

if [[ $BRIGHTNESS -lt 4800 ]]; then 	# if brightness is below 5%(exclusive),
    brightnessctl set 1%+		# it will go up by 1% 
elif [[ $BRIGHTNESS -ge 38400 ]]; then	# if it's greater than 40%(inclusive),
    brightnessctl set 10%+		# it'll be 10%
else
    brightnessctl set 5%+		# as opposed to 5% otherwise.
fi					
