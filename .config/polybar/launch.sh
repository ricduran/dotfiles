#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

m=`polybar -M | cut -d ':' -f 1`

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
MONITOR=$m polybar mainbar-i3 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar mainbar2-i3 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
