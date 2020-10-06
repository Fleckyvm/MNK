#!/bin/bash

if grep -w "Usar Grabber (SIN Colores)" /storage/.kodi/addons/script.normandy/resources/language/english/strings.po
then

sed -i 's%"Usar Grabber (SIN Colores)"%"Usar Grabber (CON Colores)"%g' /storage/.kodi/addons/script.normandy/resources/language/english/strings.po

sed -i '340s%"enabled": true,%"enabled": false,%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/epggrab/config
sed -i '362s%"enabled": false,%"enabled": true,%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/epggrab/config

kodi-send --action=Notification"(NormandyEPG,CONFIGURADA EPG SIN COLORES,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 2
systemctl restart kodi
else

sed -i 's%"Usar Grabber (CON Colores)"%"Usar Grabber (SIN Colores)"%g' /storage/.kodi/addons/script.normandy/resources/language/english/strings.po

sed -i '340s%"enabled": false,%"enabled": true,%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/epggrab/config
sed -i '362s%"enabled": true,%"enabled": false,%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/epggrab/config

kodi-send --action=Notification"(NormandyEPG,CONFIGURADA EPG CON COLORES,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 2
systemctl restart kodi
fi
