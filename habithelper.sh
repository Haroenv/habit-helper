#!/bin/bash
if [[ "$1" ]]; then
	case "$1" in
		"-i" | "--init" )
			if [[ -e "data.txt" ]]; then
				echo "There already exists a data-file. Are you sure you want to overwrite?"
				# make data
			else
				touch data.txt

			fi
			;;
		"-a" | "--add" )
			echo "-a"	# to do
			;;
		"-r" | "--remove" )
			echo "-r" # to do
			;;
		* | "-h" | "--help" )
			echo "help" #copy from readme
	esac
else
	if [[ -e "data.txt" ]]; then
		echo "print table"
		# print the table
	else 
		echo "There is no data found. Use \"./habithelper.sh -i\" to initialise a data file"
		exit
	fi
fi