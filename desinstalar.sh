#!/bin/bash

rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/input/dvb/networks/b59c72f4642de11bd4cda3c62fe080a8
rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/channel/config/*
rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/channel/tag/*
rm -rf /storage/.kodi/addons/service.tvheadend43/bin/tv_grab_NormandyEPGmv
rm -rf /storage/.kodi/addons/service.tvheadend43/bin/tv_grab_NormandyEPGnm
rm -rf /storage/.kodi/NormandyEPG
kodi-send --action=Notification"(NormandyEPG,DESINSTALADO,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 3
systemctl restart service.tvheadend43
