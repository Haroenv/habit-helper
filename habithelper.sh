#!/bin/bash

today=`date "+%Y-%m-%d"`
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
        #print=""
        lines=`grep --regexp="$" --count data.txt`
        for (( i = 0; i < $lines; i++ )); do
            #line=`sed '$i!d' data.txt`
            #if [[ line ends with one ]]; then
            #     append "${red}▨${NC}"
            #else append "${green}▨${NC}"
            #fi
            echo "one day streak"
        done
        for (( i = 1; i < $lines; i++ )); do
            #line=`sed '$i!d' data.txt`
            #previousline=`sed '$i-1!d' data.txt`
            #if [[ line ends with "1" || previousline ends with "1" ]]; then
            #     append "${red}▨${NC}"
            #else append "${green}▨${NC}"
            #fi
            echo "two day streak"
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
                lines=`egrep "$" --count data.txt`
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