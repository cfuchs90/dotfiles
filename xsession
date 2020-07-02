xmodmap ~/.Xmodmap
xrdb ~/.Xresources
export ENV=$HOME/.kshrc
xset -b # turn the bell off

display_str() {
    
    battery_chargin=$(apm -a)
    battery_status=$(apm -l)

    case $battery_chargin in
	"1")
	    BAR_STRING=" ${battery_status}%"
	    ;;
	"0")
	    if [[ $battery_chargin -eq 1 ]]; then
		echo $BAR_STRING
	    elif [[ $battery_status -lt 20 ]]; then
		BAR_STRING=" ${battery_status}%"
	    elif [[ $battery_status -lt 50 ]]; then
		BAR_STRING=" ${battery_status}%"
	    else
		BAR_STRING=" ${battery_status}%"
	    fi
	    ;;
	esac

    BAR_STRING="$BAR_STRING $(date +"%a %e %b  %H:%M")"
    echo $BAR_STRING
}


while true
do
	# DISPLAY_STRING="Battery $(apm -l)%  $(date +"%a %e %b %H:%M")"
	DISPLAY_STRING=$(display_str)
	xsetroot -name "$DISPLAY_STRING"
	sleep 1
done &

xidle -delay 5 -program "/usr/X11R6/bin/xlock -mode matrix" -timeout 300 &
~/.fehbg &
compton &
exec /usr/local/bin/dwm
