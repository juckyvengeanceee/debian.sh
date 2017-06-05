#!/bin/bash
# Note, we are using "echo 3", but it is not recommended in production instead use "echo 1"
#echo "echo 3 > /proc/sys/vm/drop_caches"
##
###################################################################
######################
###################################################################

echo 1 > /proc/sys/vm/drop_caches
    sleep 2
echo 2 > /proc/sys/vm/drop_caches
    sleep 4
    #echo 3 > /proc/sys/vm/drop_caches
   
swapoff -a && swapon -a
