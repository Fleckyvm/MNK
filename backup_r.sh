#!/bin/bash

if [ -f /storage/.kodi/NormandyEPG/BACKUP_TVH.tar ]
then
systemctl stop service.tvheadend43
rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43
rm -rf /storage/.kodi/NormandyEPG/picons 
rm -rf /storage/.kodi/NormandyEPG/Normandy_EPG.ver
tar -xf /storage/.kodi/NormandyEPG/BACKUP_TVH.tar -C /
kodi-send --action=Notification"(NormandyEPG,BACKUP RESTAURADO,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 3
systemctl restart service.tvheadend43
else
kodi-send --action=Notification"(NormandyEPG,NO HAY BACKUP DISPONIBLE,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 2
fi
kodi-send -a RunAddOn"(script.normandy)"
