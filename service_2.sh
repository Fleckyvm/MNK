#!/bin/bash

if grep -w "Habilitar servicio Notificacion" /storage/.kodi/addons/script.normandy/resources/language/english/strings.po
then
sed -i 's%"Habilitar servicio Notificacion"%"Deshabilitar servicio Notificacion"%g' /storage/.kodi/addons/script.normandy/resources/language/english/strings.po
rm -f /storage/.kodi/addons/script.normandy/bin/service.sh
cd /storage/.kodi/addons/script.normandy/bin
wget https://raw.githubusercontent.com/Fleckyvm/MNK/master/service_notificacion.sh
mv service_notificacion.sh service.sh
mv /storage/.kodi/addons/script.normandy/service_off.py /storage/.kodi/addons/script.normandy/service.py
kodi-send --action=Notification"(NormandyEPG,SERVICIO NOTIFICACIONES ON,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 2
systemctl restart kodi
else
sed -i 's%"Deshabilitar servicio Notificacion"%"Habilitar servicio Notificacion"%g' /storage/.kodi/addons/script.normandy/resources/language/english/strings.po
rm -f /storage/.kodi/addons/script.normandy/bin/service.sh
mv /storage/.kodi/addons/script.normandy/service.py /storage/.kodi/addons/script.normandy/service_off.py
kodi-send --action=Notification"(NormandyEPG,SERVICIO NOTIFICACIONES OFF,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 2
systemctl restart kodi
fi
