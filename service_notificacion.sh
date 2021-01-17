#!/bin/bash

if
[ "`cat /storage/.kodi/NormandyEPG/Normandy_EPG.ver 2>/dev/null`" != "`curl -L https://github.com/NormandyEPG/NEPG/raw/master/Normandy_EPG.ver 2>/dev/null`" ]; 
then
kodi-send --action=Notification"(NormandyEPG,DISPONIBLE ACTUALIZACION EPG,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 2
kodi-send --action=Notification"(NormandyEPG,ACTUALICE DESDE EL ADDON,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
else
sleep 2
fi
