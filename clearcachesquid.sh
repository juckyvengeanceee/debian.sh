#!/bin/bash
 
# direktori cache proxy
CACHEDIR=/var/spool/squid
 
# kapasitas direktori cache proxy (80GB)
CACHEDIRSIZE=85899345920
ONEMB=1048576
ONEGB=1073741824
COUNTMB=`expr $CACHEDIRSIZE / $ONEMB`
COUNTGB=`expr $CACHEDIRSIZE / $ONEGB`
 
COUNTALOC=`expr $CACHEDIRSIZE / $ONEMB`
 
# mendapatkan besaran direktori cache saat ini
SIZE=`du -bc $CACHEDIR | grep total | awk '{print $1}'`
SIZEM=`du -bch $CACHEDIR | grep total | awk '{print $1}'`
 
 
# jika besaran direktori cache saat ini sama atau lebih besar dari 
# kapasitas direktori cache proxy maka hapus cache proxy
if [ $SIZE -ge $CACHEDIRSIZE ]
then
 
/usr/bin/clear
echo "=================================="
echo "=== Generate Clear Cache Squid ==="
echo "=================================="
 
echo "Cahce Squid Proxy      :" $CACHEDIR
echo "Jumlah cache tersimpan :" $SIZE Byte / $SIZEM
echo "Batas maximum cache    :" $CACHEDIRSIZE Byte / $COUNTALOC MB
echo " * Clear cache squid in proccess ..."
 
sleep 10
 
 service squid3 stop        # stop service squid
 rm -fdR $CACHEDIR/*           # hapus cache proxy
 squid3 -z                      # membuat cache direktori
 service squid3 start       # start service squid
 
/usr/bin/clear
 
echo "===================================="
echo "=== Clear Cache Squid Success !! ==="
echo "===      by jucky vengeance      ==="
echo "===================================="
 
else
 
/usr/bin/clear
echo "================================================"
echo "=== Status Directory Cache Squid Proxy  [OK] ==="
echo "===      Modified by jucky vengeance         ==="
echo "================================================"
echo "Cache directory squid :" $SIZE Byte / $SIZEM 
echo "Alokasi cache squid   :" $CACHEDIRSIZE Byte / $COUNTMB MB / $COUNTGB GB
 
fi
