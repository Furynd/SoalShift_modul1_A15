#!/bin/bash

hour=`date +"%H"`
ind=1
for x in {a..z}
do 
    arr[ind]=$x
    ind=$((ind+1))
done

ind=1
for x in {A..Z}
do 
    arrr[ind]=$x
    ind=$((ind+1))
done
IFS=

cat /var/log/syslog | tr a-z `echo ${arr[$hour]}`-za-`echo ${arr[$hour]}` | tr A-Z `echo ${arrr[$hour]}`-ZA-`echo ${arrr[$hour]}`  > ~/modul1/`date +"%H:%M %d-%m-%Y"`.log
