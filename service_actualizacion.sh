#!/bin/bash

if
[ "`cat /storage/.kodi/NormandyEPG/Normandy_EPG.ver 2>/dev/null`" != "`curl -s http://normandy.es/teuve/Normandy_EPG.ver 2>/dev/null`" ]; 
then
kodi-send --action=Notification"(NormandyEPG,ahora borrar e instalar,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 2
kodi-send --action=Notification"(NormandyEPG,y seguir instalando,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
else
sleep 2
fi
