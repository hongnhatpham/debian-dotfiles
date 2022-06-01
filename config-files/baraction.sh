#!/bin/bash
# baraction.sh for spectrwm status bar

## DISK
hdd() {
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "HDD $hdd"
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "MEM $mem"
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU $cpu%"
}

## VOLUME
vol() {
    vol=`pulsemixer --get-volume | awk '{print $1}'`
    echo -e "VOL $vol%"
}

## BAT
bat() {
	bat=`acpi | awk -F', ' '{print $2}'`
	status=`acpi | awk -F', ' '{print $1}'`
	if [[ $status == "Battery 0: Charging" ]]
	then
		echo -e "BAT $bat +"
	elif [[ $status == "Battery 0: Discharging" ]]
	then
		echo -e "BAT $bat -"
	else
		echo -e "BAT $bat"
	fi
}

SLEEP_SEC=3
#loops forever outputting a line every SLEEP_SEC secs

# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
# So I would love to add more functions to this script but it makes the 
# echo output too long to display correctly.
while :; do
	echo "+@fg=8;$(cpu)+4<$(mem)+4<$(hdd)+4<$(vol)+4<$(bat)"
	sleep $SLEEP_SEC
done

