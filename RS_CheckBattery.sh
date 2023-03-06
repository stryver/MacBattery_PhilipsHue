#!/bin/bash

# Hue Bridge IP
HUE_BRIDGE_IP="111.111.1.11"
# Hue Bridge Username
HUE_USERNAME="myusername"
# Hue Light ID
LIGHT1_ID="8"
LIGHT2_ID="9"
# Hue Plug ID
#PLUG_ID="2"

while true
do
  battery_percentage=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
  if [ "$battery_percentage" -lt 20 ]; then
    curl -X PUT -d '{"on":true, "hue":0, "sat":254, "bri":254}' http://$HUE_BRIDGE_IP/api/$HUE_USERNAME/lights/$LIGHT2_ID/state
    curl -X PUT -d '{"on":true, "hue":0, "sat":254, "bri":254}' http://$HUE_BRIDGE_IP/api/$HUE_USERNAME/lights/$LIGHT1_ID/state
    #curl -X PUT -d '{"on":true}' http://$HUE_BRIDGE_IP/api/$HUE_USERNAME/lights/$PLUG_ID/state
  fi
  if [ "$battery_percentage" -gt 99 ]; then
    curl -X PUT -d '{"on":true, "hue":25600, "sat":254, "bri":254}' http://$HUE_BRIDGE_IP/api/$HUE_USERNAME/lights/$LIGHT2_ID/state
    curl -X PUT -d '{"on":true, "hue":25600, "sat":254, "bri":254}' http://$HUE_BRIDGE_IP/api/$HUE_USERNAME/lights/$LIGHT1_ID/state
    #curl -X PUT -d '{"on":false}' http://$HUE_BRIDGE_IP/api/$HUE_USERNAME/lights/$PLUG_ID/state
  fi
  echo "Battery Percentage: $battery_percentage"
  sleep 60
done
