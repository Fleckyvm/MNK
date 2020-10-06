#!/bin/bash
#### Descripción: Instalador NormandyEPG para TVH add-on 4.3 
#### Creado por: Flecky para NormandyEPG.es | Monkey Brothers

#
NOMBRE_APP="NormandyEPG"
CARPETA_TVH="/storage/.kodi/userdata/addon_data/service.tvheadend43"
carpeta_channel="$CARPETA_TVH/channel/config/*"
carpeta_tag="$CARPETA_TVH/channel/tag/*"


# Borramos configuración actual de TVH
	rm -rf /storage/.kodi/NormandyEPG/picons
	rm -rf /storage/.kodi/NormandyEPG/Normandy_EPG.ver
	cd $CARPETA_TVH
	rm -f config
	rm -f settings.xml
	rm -rf bouquet/
	rm -rf epggrab/
	rm -rf profile/
	rm -rf service_mapper/
	rm -rf input/dvb/networks/b59c72f4642de11bd4cda3c62fe080a8/
	rm -rf xmltv/
	
	
# Borramos configuración vieja de TVH de NormandyEPG, conservando redes y canales mapeados por los usuarios
	rm -f 
	
	if [ "$1" != "ALL" ];then
		# Recorremos los ficheros de estas carpetas para borrar solo los que tengan la marca
		for fichero in $carpeta_channel $carpeta_tag
		do 
		   if [ -f "$fichero" ]; then  
			 ultima=$(tail -n 1 $fichero)
			 if [[ "$ultima" = $NOMBRE_APP ]]; then
			   rm -f $fichero 
			 fi
		   fi
		done
	else
		# Borramos todos los canales, tags y redes
		rm -rf $carpeta_channel
		rm -rf $carpeta_tag
		rm -rf input/
	fi


#Descargarmos NormandyEPG
wget -P /storage/ normandy.es/teuve/Normandy_EPG.zip 
mkdir -p /storage/.kodi/NormandyEPG /storage/.kodi/NormandyEPG/tmp
unzip -P "p~a6T<%}bwX<GwHQ" /storage/Normandy_EPG.zip -d /storage/.kodi/NormandyEPG/tmp 
cp -r /storage/.kodi/NormandyEPG/tmp/Normandy_EPG.ver /storage/.kodi/NormandyEPG
cp -r /storage/.kodi/NormandyEPG/tmp/storage/.kodi /storage
rm -rf /storage/.kodi/NormandyEPG/tmp 
rm -rf /storage/Normandy_EPG.zip
kodi-send --action=Notification"(NormandyEPG,EPG INSTALADA,2000,/storage/.kodi/addons/script.normandy/resources/icopicofix.png)"
sleep 3
sed -i 's%"/usr/bin/tv_grab_file": {%"/storage/.kodi/addons/service.tvheadend43/bin/tv_grab_file": {%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/epggrab/config
sed -i 's%"/usr/bin/tv_grab_NormandyEPGnm": {%"/storage/.kodi/addons/service.tvheadend43/bin/tv_grab_NormandyEPGnm": {%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/epggrab/config
sed -i 's%"/usr/bin/tv_grab_NormandyEPGmv": {%"/storage/.kodi/addons/service.tvheadend43/bin/tv_grab_NormandyEPGmv": {%g' /storage/.kodi/userdata/addon_data/service.tvheadend43/epggrab/config
sh /storage/.kodi/addons/service.tvheadend43/bin/tv_grab_NormandyEPGnm
systemctl restart service.tvheadend43
kodi-send -a RunAddOn"(script.normandy)"
