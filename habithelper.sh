#!/bin/bash
if [[ !"$1" ]]; then
	if [[ -e "data.txt" ]]; then
		echo "print table"
		# print the table
	else 
		echo "help"
			#linking to the help, or something
	fi
else
	case "$1" in
		"-i" | "--init" )
			if [[ -e "data.txt" ]]; then
				echo "There already exists a data-file. Are you sure you want to overwrite?"
				# make data
			fi
			;;
		"-a" | "--add" )
			echo "-a"	# to do
			;;
		"-r" | "--remove" )
			echo "-r" # to do
			;;
		"-h" | "--help" )
			echo "help" #copy from readme
	esac
fi