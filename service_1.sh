#!/bin/bash

if grep -w "Habilitar servicio Autoactualizacion" /storage/.kodi/addons/script.normandy/resources/language/english/strings.po
then
sed -i 's%"Habilitar servicio Autoactualizacion"%"Deshabilitar servicio Autoactualizacion"%g' /storage/.kodi/addons/script.normandy/resources/language/english/strings.po
rm -f /storage/.kodi/addons/script.normandy/bin/service.sh
wget https://raw.githubusercontent.com/Fleckyvm/MNK/master/service_actualizacion.sh /storage/.kodi/addons/script.normandy/bin/service.sh
kodi-send --action=Notification"(NormandyEPG,OK,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
else
sed -i 's%"Deshabilitar servicio Autoactualizacion"%"Habilitar servicio Autoactualizacion"%g' /storage/.kodi/addons/script.normandy/resources/language/english/strings.po
rm -f /storage/.kodi/addons/script.normandy/bin/service.sh
kodi-send --action=Notification"(NormandyEPG,NOK,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
fi
