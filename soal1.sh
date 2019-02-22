#!/bin/bash

unzip /home/mrx/Downloads/nature.zip -d /home/mrx/Downloads

tmp=0

for i in /home/mrx/Downloads/nature/*.jpg
do
	base64 -d $i | xxd -r > /home/mrx/Downloads/nature/hasil$tmp.jpg
	tmp=$(($tmp+1))
	rm $i
done
