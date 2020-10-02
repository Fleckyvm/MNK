#!/bin/bash

if
[ "`cat /storage/.kodi/NormandyEPG/Normandy_EPG.ver 2>/dev/null`" != "`curl -s http://normandy.es/teuve/Normandy_EPG.ver 2>/dev/null`" ]; 
then
cd /storage/.kodi/addons/script.normandy/bin
wget https://raw.githubusercontent.com/Fleckyvm/MNK/master/instalar.sh
sh instalar.sh
else
sleep 2
fi
