#!/bin/bash

systemctl stop service.tvheadend43
systemctl stop service.softcam.oscam
rm -rf /storage/.kodi/addons/service.tvheadend43
rm -rf /storage/.kodi/addons/service.softcam.oscam

if [ -d /storage/.kodi/addons/service.system.docker ]
then
kodi-send --action=Notification"(NormandyEPG,DOCKER YA INSTALADO,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
else

[ -f /storage/.opt/bin/wget ] && ncert="--no-check-certificate"
set -e
ADDON="service.system.docker"
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
mv service.system.docker /storage/.kodi/addons/
systemctl restart kodi
sleep 15
curl -s -H "Content-Type: application/json" -X POST -d '{"jsonrpc": "2.0", "method": "Addons.SetAddonEnabled", "params": {"addonid": "service.system.docker","enabled":true}, "id": 1}' http://localhost:8080/jsonrpc

kodi-send --action=Notification"(NormandyEPG,DOCKER INSTALADO OK,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 2
fi

reboot
