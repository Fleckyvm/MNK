#!/bin/bash

if grep -q reader /storage/.kodi/userdata/addon_data/service.softcam.oscam/config/oscam.server
then
rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/caclient/*
cp -r /storage/.kodi/addons/script.normandy/bin/0c84089713e3668e1cbba92f486b68c0 /storage/.kodi/userdata/addon_data/service.tvheadend43/caclient/0c84089713e3668e1cbba92f486b68c0
cp -r /storage/.kodi/addons/script.normandy/bin/oscam.conf /storage/.kodi/userdata/addon_data/service.softcam.oscam/config/oscam.conf
cp -r /storage/.kodi/addons/script.normandy/bin/oscam.user /storage/.kodi/userdata/addon_data/service.softcam.oscam/config/oscam.user
kodi-send --action=Notification"(NormandyEPG,1CONEXION ESTABLECIDA TVH-OSCAM,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 3
systemctl restart service.softcam.oscam
sleep 1
systemctl restart service.tvheadend43
else
rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/caclient/*
cp -r /storage/.kodi/addons/script.normandy/bin/0c84089713e3668e1cbba92f486b68c0 /storage/.kodi/userdata/addon_data/service.tvheadend43/caclient/0c84089713e3668e1cbba92f486b68c0
cp -r /storage/.kodi/addons/script.normandy/bin/oscam.conf /storage/.kodi/userdata/addon_data/service.softcam.oscam/config/oscam.conf
cp -r /storage/.kodi/addons/script.normandy/bin/oscam.server /storage/.kodi/userdata/addon_data/service.softcam.oscam/config/oscam.server
cp -r /storage/.kodi/addons/script.normandy/bin/oscam.user /storage/.kodi/userdata/addon_data/service.softcam.oscam/config/oscam.user
kodi-send --action=Notification"(NormandyEPG,2CONEXION ESTABLECIDA TVH-OSCAM,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 3
wget https://github.com/NormandyEPG/Picons-NormandyEPG/archive/master.zip
mkdir -p /storage/.kodi/NormandyEPG /storage/.kodi/NormandyEPG/tmp-tpl
unzip /storage/master.zip -d /storage/.kodi/NormandyEPG/tmp-tpl
cp -r /storage/.kodi/NormandyEPG/tmp-tpl/Picons-NormandyEPG-master/tpl /storage/.kodi/NormandyEPG
rm -rf /storage/.kodi/NormandyEPG/tmp-tpl
rm -rf /storage/master.zip
sleep 3
systemctl restart service.softcam.oscam
sleep 1
systemctl restart service.tvheadend43
fi
kodi-send -a RunAddOn"(script.normandy)"
