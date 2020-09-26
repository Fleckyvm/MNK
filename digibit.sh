#!/bin/bash

sed -i 's%"enabled": false,%"enabled": true,%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*

sed -i 's%"tcp_mode": false,%"tcp_mode": true,%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i 's%"ota_epg": true,%"ota_epg": false,%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i 's%"initscan": true,%"initscan": false,%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i 's%"idlescan": true,%"idlescan": false,%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*

sed -i '51s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '62s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '73s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '84s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '120s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '131s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '142s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '153s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '189s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '200s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '211s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '222s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '258s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '269s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '280s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*
sed -i '291s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /storage/.kodi/userdata/addon_data/service.tvheadend43/input/satip/adapters/*

kodi-send --action=Notification"(NormandyEPG,HABILITADOS TUNNERS DIGIBIT R1,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 3
systemctl restart service.tvheadend43
