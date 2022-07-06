#!/bin/bash

function randomChange() {

	l=15
	[ -n "$1" ] && l=$1
	[ -n "$2" ] && l=$(shuf --random-source=/dev/urandom -i $1-$2 -n 1)
	tr -dc A-Za-z0-9 < /dev/urandom | head -c ${l} | xargs>skyline.txt

	git add .
	git commit -m "build Github Skyline"
	git push
	echo "------------------- Floor built ------------------"
	sleep 2 
}

function execTimes() {

	echo "Height of skyscraper :"
	sleep 1
	read times
	echo -e "Building skypscraper, $times commits tall...\n"
	sleep 2
	for ((i=0; i<=$times-1;i++)); do
		randomChange
	done
}

execTimes
