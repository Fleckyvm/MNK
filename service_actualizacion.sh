#!/bin/bash

if
[ "`cat /storage/.kodi/NormandyEPG/Normandy_EPG.ver 2>/dev/null`" != "`curl -s http://normandy.es/teuve/Normandy_EPG.ver 2>/dev/null`" ]; 
then
cd /storage/.kodi/addons/script.normandy/bin
wget https://raw.githubusercontent.com/Fleckyvm/MNK/master/instalar.sh
sed -i 's%kodi-send -a RunAddOn"(script.normandy)"% %g' /storage/.kodi/addons/script.normandy/bin/instalar.sh
sh instalar.sh && rm -f instalar.sh
else
sleep 2
fi
