#!/bin/bash

today=`date "+%Y-%m-%d"`
lines=`egrep g"$" --count data.txt`
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0m' # No Color

initialise () {
    rm data.txt
    touch data.txt
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
}

print () {
    if [[ -e "data.txt" ]]; then
        echo "print"
        #do more than echo
        #print a line of the data in data.txt
        for (( i = 0; i < $lines; i++ )); do
            #cont=""
            #line=`sed '$i!d' data.txt`
            #if [[ `last character of line` == "1" ]]; then
            #     cont += "${red}▨${NC}"
            #else 
            #     cont += "${green}▨${NC}"
            #fi
            echo -e "continuous: $cont"
        done
        for (( i = 1; i < $lines; i++ )); do
            #double=""
            #line=`sed '$i!d' data.txt`     #How to use the data of i in here?
            #previousline=`sed '$i-1!d' data.txt`
            #if [[ `last character of line` == "1" || `last character of previousline` == "1" ]]; then
            #     double += "${red}▨${NC}"
            #else 
            #     double += "${green}▨${NC}"
            #fi
            echo -e "double: $double"
        done
    else 
        echo "There is no data found. Use \"./habithelper.sh -i\" to initialise a data file"
        exit
    fi
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
                    exit
                fi
            else
                initialise
                echo "created a new data-file"
            fi
            ;;
        "-a" | "--add" )
            if [[ -e "data.txt" ]]; then
                #lastline=`sed '$lines!d' data.txt`
                # return the last line
                # if [[ the last line starts with $today ]]; then 
                #   echo "you already worked today"
                #   exit
                # else
                # somehow the missing dates have to be filled in with 0
                echo "$today | 1" >> data.txt
                echo "good work!"
                # fi
                print
            else 
                help
            fi
            ;;
        "-r" | "--remove" )
            #make the last filled value "0" instead of "1"
            ;;
        * | "-h" | "--help" )
            help
    esac
else
    print
fi