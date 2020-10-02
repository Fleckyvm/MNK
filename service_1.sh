#!/bin/bash

if grep -w "Habilitar servicio Autoactualizacion" /storage/.kodi/addons/script.normandy/resources/language/english/strings.po
then

sed -i 's%"Deshabilitar servicio Notificacion"%"Habilitar servicio Notificacion"%g' /storage/.kodi/addons/script.normandy/resources/language/english/strings.po
rm -f /storage/.kodi/addons/script.normandy/bin/service.sh

sed -i 's%"Habilitar servicio Autoactualizacion"%"Deshabilitar servicio Autoactualizacion"%g' /storage/.kodi/addons/script.normandy/resources/language/english/strings.po
rm -f /storage/.kodi/addons/script.normandy/bin/service.sh
cd /storage/.kodi/addons/script.normandy/bin
wget https://raw.githubusercontent.com/Fleckyvm/MNK/master/service_actualizacion.sh
mv service_actualizacion.sh service.sh
mv /storage/.kodi/addons/script.normandy/service_off.py /storage/.kodi/addons/script.normandy/service_on.py
kodi-send --action=Notification"(NormandyEPG,SERVICIO ACTUALIZACIONES ON,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 2
systemctl restart kodi
else
sed -i 's%"Deshabilitar servicio Autoactualizacion"%"Habilitar servicio Autoactualizacion"%g' /storage/.kodi/addons/script.normandy/resources/language/english/strings.po
rm -f /storage/.kodi/addons/script.normandy/bin/service.sh
mv /storage/.kodi/addons/script.normandy/service_on.py /storage/.kodi/addons/script.normandy/service_off.py
kodi-send --action=Notification"(NormandyEPG,SERVICIO ACTUALIZACIONES OFF,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 2
systemctl restart kodi
fi
