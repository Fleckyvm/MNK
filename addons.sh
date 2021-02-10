#!/bin/bash

if [ -d /storage/.kodi/addons/service.tvheadend43 ]
then
kodi-send --action=Notification"(NormandyEPG,TVHEADEND43 YA INSTALADO,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
else

[ -f /storage/.opt/bin/wget ] && ncert="--no-check-certificate"
set -e
ADDON="service.tvheadend43"
DATADIR=$(xmlstarlet sel -t -v \
	"/addon/extension/datadir[@zip='true']" \
    /usr/share/kodi/addons/repository.coreelec/addon.xml)
ADDONS_XML_GZ=$(xmlstarlet sel -t -v \
    "/addon/extension/info" \
    /usr/share/kodi/addons/repository.coreelec/addon.xml)
wget ${ncert} -O - "$ADDONS_XML_GZ" | zcat > /tmp/addons.xml
VERSION=$(xmlstarlet sel -t -v \
    "/addons/addon[@id='${ADDON}']/@version" \
     /tmp/addons.xml )
ADDON_FILENAME="${ADDON}-${VERSION}.zip"
for a in $ADDON_FILENAME; do
    wget ${ncert} "${DATADIR}/${ADDON}/${a}"
done
unzip $ADDON_FILENAME
rm $ADDON_FILENAME
mv service.tvheadend43 /storage/.kodi/addons/
systemctl restart kodi
sleep 15
curl -s -H "Content-Type: application/json" -X POST -d '{"jsonrpc": "2.0", "method": "Addons.SetAddonEnabled", "params": {"addonid": "service.tvheadend43","enabled":true}, "id": 1}' http://localhost:8080/jsonrpc

kodi-send --action=Notification"(NormandyEPG,TVHEADEND43 INSTALADO OK,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 3
fi

if [ -d /storage/.kodi/addons/service.softcam.oscam ]
then
kodi-send --action=Notification"(NormandyEPG,OSCAM YA INSTALADO,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
else

wget -P /storage/ https://raw.githubusercontent.com/katanico/MonkeyDigital/master/Repositorio/service.softcam.oscam/service.softcam.oscam-9.2.109.zip
mkdir -p /storage/oscam-tmp
unzip /storage/service.softcam.oscam-9.2.109.zip -d /storage/oscam-tmp
cp -r /storage/oscam-tmp/service.softcam.oscam /storage/.kodi/addons
rm -rf /storage/oscam-tmp
rm -rf /storage/service.softcam.oscam-9.2.109.zip

systemctl restart kodi
sleep 15
curl -s -H "Content-Type: application/json" -X POST -d '{"jsonrpc": "2.0", "method": "Addons.SetAddonEnabled", "params": {"addonid": "service.softcam.oscam","enabled":true}, "id": 1}' http://localhost:8080/jsonrpc

kodi-send --action=Notification"(NormandyEPG,OSCAM INSTALADO OK,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 3
fi

kodi-send -a RunAddOn"(script.normandy)"
