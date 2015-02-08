#!/bin/bash
initialise () {
    touch data.txt
    #get current date
    #first line is current date
}

help () {
    echo "usage: ./habithelper.sh [options]

                will print a table of when you've done the thing and when you didn't. 
                It will also show a table of two consecutive days. 
-i or --init    will initialise a data.txt-file, in which the days worked and days not worked 
                will be stored, as well as the day traking started.
-a or --add     will add the current day as one you worked.
-r or --remove  will remove the current day as one you worked
-h or --help    will display these options."
    #show the options
}

if [[ "$1" ]]; then
    case "$1" in
        "-i" | "--init" )
            if [[ -e "data.txt" ]]; then
                echo "There already exists a data-file. Are you sure you want to overwrite? (y/n)"
                read overwrite
                if [[ $overwrite == y ]]; then
                    echo "overwritten data-file"
                    initialise
                    exit
                else
                    echo "data not overwritten"
                fi
            else
                initialise
                echo "created a new data-file"
            fi
            ;;
        "-a" | "--add" )
            echo "-a"   # to do
            ;;
        "-r" | "--remove" )
            echo "-r" # to do
            ;;
        * | "-h" | "--help" )
            help
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