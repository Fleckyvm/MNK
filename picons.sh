#!/bin/bash

kodi-send --action=Notification"(NormandyEPG,FIX ICONOS,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/imagecache/*
rm -rf /storage/.kodi/userdata/Thumbnails/*
kodi-send --action=Notification"(NormandyEPG,REPARADO Y REINICIANDO...,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 3
systemctl restart kodi
