#!/bin/bash
adb kill-server
adb tcpip 5555 && sleep 3
ipadr=$(adb shell ip -o a | grep "wlan0" | head -n1 | awk '{print $4}' | awk '{ print substr($1, 1, length($1)-3) '}) #получение IP
if [[ $ipadr == "" ]]; then
notify-send "ADB_SC" "Failed to get ip"
else
adb connect $ipadr:5555 # подключение телефона через TCP
notify-send "ADB_SC" "Success"
fi
