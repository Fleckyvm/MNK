#!/bin/bash

kodi-send -a PlayMedia"(http://normandy.es/files/Creditos_Monkey.avi)"
sleep 5
kodi-send -a RunAddOn"(script.normandy)"
