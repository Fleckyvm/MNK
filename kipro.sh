#!/bin/bash

wget -P /storage/ normandy.es/teuve/Normandy_EPG.zip 
mkdir -p /storage/.kodi/NormandyEPG/tmp
unzip -P "p~a6T<%}bwX<GwHQ" /storage/Normandy_EPG.zip -d /storage/.kodi/NormandyEPG/tmp 
cp -r /storage/.kodi/NormandyEPG/tmp/storage/.kodi/userdata/addon_data/service.tvheadend43/input/linuxdvb/adapters/9b491091fefdfe15e5cecb93b06ccb8a /storage/.kodi/userdata/addon_data/service.tvheadend43/input/linuxdvb/adapters/9b491091fefdfe15e5cecb93b06ccb8a
rm -rf /storage/.kodi/NormandyEPG/tmp 
rm -rf /storage/Normandy_EPG.zip
kodi-send --action=Notification"(NormandyEPG,HABILITADOS TUNNERS KI PRO,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 3
systemctl restart service.tvheadend43
