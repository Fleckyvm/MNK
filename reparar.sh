#!/bin/bash

if [ -f /storage/.kodi/addons/service.tvheadend43/bin/tv_grab_NormandyEPGmv ]
then
kodi-send --action=Notification"(NormandyEPG,GRABBERS ESTA OK,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 1
else
wget -P /storage/ normandy.es/teuve/Normandy_EPG.zip 
mkdir -p /storage/.kodi/NormandyEPG/tmp
unzip -P "p~a6T<%}bwX<GwHQ" /storage/Normandy_EPG.zip -d /storage/.kodi/NormandyEPG/tmp 
cp -r /storage/.kodi/NormandyEPG/tmp/storage/.kodi/addons /storage/.kodi
rm -rf /storage/.kodi/NormandyEPG/tmp 
rm -rf /storage/Normandy_EPG.zip
kodi-send --action=Notification"(NormandyEPG,GRABBERS INSTALADOS,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 3
systemctl restart service.tvheadend43
fi
