#!/bin/bash

cd /storage/.kodi/NormandyEPG
rm -rf BACKUP_TVH.tar
tar -cf BACKUP_TVH.tar /storage/.kodi/userdata/addon_data/service.tvheadend43 /storage/.kodi/NormandyEPG/picons /storage/.kodi/NormandyEPG/Normandy_EPG.ver

kodi-send --action=Notification"(NormandyEPG,BACKUP CREADO,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
