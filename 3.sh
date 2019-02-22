#!/bin/bash
n1="password"
n2=1
n3=".txt"

while [ true ]
do

n4="$n1$n2$n3"
if [ ! -e "$n4" ]
then
	break
fi
n2=$((n2+1))

done

function cek(){

length=12
digits=({0..9})
lower=({a..z})
upper=({A..Z})
CharArray=(${digits[*]} ${lower[*]} ${upper[*]})
ArrayLength=${#CharArray[*]}
password=""

d=0
l=0
u=0

id=-1
il=-1
iu=-1

for i in `seq 1 $length`
do
	index=$(($RANDOM%$ArrayLength))
	char=${CharArray[$index]}
	password=${password}${char}

	if [ $index -le 9 ]
	then
		d=$((d+1))
		if [ $id -eq -1 ]
		then
			id=$i
		fi
	elif [ $index -le 35 ]
	then
		l=$((l+1))
		if [ $il -eq -1 ]
		then
			il=$i
		fi
	else
		u=$((u+1))
		if [ $iu -eq -1 ]
		then
			iu=$i
		fi
	fi
done

if [ $id -eq -1 ]
then
	index=$(($RANDOM%10))
	char=${CharArray[$index]}
	if [ $l -gt 1 ]
	then
	password[$((il-1))]=$char
	il=$((il+1))
	l=$((l-1))
	else
	password[$((iu-1))]=$char
	iu=$((iu+1))
	u=$((u-1))
	fi
fi

if [ $il -eq -1 ]
then
	index=$(($RANDOM%26))
	char=${CharArray[$index+10]}
	if [ $d -gt 1 ]
	then
	password[$((id-1))]=$char
        id=$((id+1))
        d=$((d-1))
        else
        password[$((iu-1))]=$char
        iu=$((iu+1))
        u=$((u-1))
        fi
fi

if [ $iu -eq -1 ]
then
	index=$(($RANDOM%26))
	char=${CharArray[$index+36]}
	if [ $l -gt 1 ]
	then
	password[$((il-1))]=$char
        il=$((il+1))
        l=$((l-1))
        else
        password[$((id-1))]=$char
        id=$((id+1))
        d=$((d-1))
        fi
fi

echo "$password"
}

hasil=cek
`$hasil >> $n4`
