#!/bin/bash
hour=${1:0:2}
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

cat $1 | tr `echo ${arr[$hour]}`-za-`echo ${arr[$((hour-1))]}` a-z | tr `echo ${arrr[$hour]}`-ZA-`echo ${arrr[$hour]}` A-Z > ~/sisop/modul1/soalshift/$1.log
