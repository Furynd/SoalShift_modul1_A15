#!/bin/bash

filename="$1"

country=`awk 'BEGIN{FS=","}
NR != 1  {
	if($7==2012){
		x[$1] += $10}} 
END {
	y=0;
	for(z in x) {
		if (x[z] > y){
			y = x[z]; n=z}}
	print n
}' $filename`

echo "Negara dengan penjualan terbanyak 2012:"
echo $country
awk -v var="$country" 'BEGIN {FS=","}
NR != 1  {
	if($7==2012 && $1==var){
		x[$4] += $10}} 
END {
	for(z in x) {
	print x[z] "," z}
}' $filename | sort -gr | awk 'BEGIN{FS=","}{print $2}' > 2.txt

echo "3 product-line yang memberikan penjualan terbanyak:"
for (( i=0; i<3; i++))
do
	pline[$i]=`cat 2.txt | awk NR==$((i+1))`
	echo "-"${pline[$i]}
done 

echo "3 product yang menberikan penjualan terbanyak:"
awk -v country="$country" -v p1="${pline[0]}" -v p2="${pline[0]}" -v p3="${pline[0]}" 'BEGIN{FS=","}
NR!=1 {
	if($7==2012 && $1==country && ($4==p1 || $4==p2 || $4==p3)){
		x[$5]+=$10
	}
}
END {
	for(z in x) {
	print x[z] "," z}
}' $filename | sort -gr | awk 'BEGIN{FS=","}NR<4{print "-"$2}'