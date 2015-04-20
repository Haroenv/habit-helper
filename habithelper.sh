#!/bin/bash

today=`date "+%Y-%m-%d"`
if [[ -e "data.txt" ]]; then
    lines=`egrep g"$" --count data.txt`
fi
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0m' # No Color

initialise () {
    if [[ "$1" == "overwrite" ]]; then
        rm data.txt
        touch data.txt
    else
        touch data.txt
    fi
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
        echo "continuous data"  #remove when working
        for (( i = 0; i < $lines; i++ )); do
            #cont=""
            #line=`sed '$i!d' data.txt`
            #lastchar=`sed '$line!d' data.txt` #not line, but last character
            #if [[ $lastchar == "1" ]]; then
            #     cont += "${red}▨${NC}"
            #else
            #     cont += "${green}▨${NC}"
            #fi
            echo -e "continuous: $cont"
        done
        echo "double data"  #to remove when working
        for (( i = 1; i < $lines; i++ )); do
            #double=""
            #line=`sed '$i!d' data.txt`     #How to use the data of i in here?
            #previousline=`sed '$i-1!d' data.txt`
            #lastchar=`sed '$line!d' data.txt` #not line, but last character
            #lastprevchar=`sed '$previousline!d' data.txt` #not line, but last character
            #if [[ $lastchar == "1" || $lastprevchar == "1" ]]; then
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
                    initialise "overwrite"
                    exit
                else
                    echo "data not overwritten"
                    exit
                fi
            else
                initialise "no overwrite"
                echo "created a new data-file"
            fi
            ;;
        "-a" | "--add" )
            if [[ -e "data.txt" ]]; then
                lastline=`sed '1!d' data.txt` # lastline=`sed '$lines!d' data.txt`
                # return the last line
                lastdate=${lastline:0:10}
                if [[ $lastdate == $today ]]; then
                  echo "you already worked today"
                  exit
                else if [[ $lastdate == $yesterday ]]; then
                    echo "$today | 1" >> data.txt
                    echo "good work!"
                # else
                #   echo "$thosedays | 0" >> data.txt
                #   if [[ $amountmissing < 2 ]]; then
                #       echo "you've missed a day, but not all is lost"
                #   fi
                #   # somehow the missing dates have to be filled in with 0
                fi
                print
            else
                help
            fi
            ;;
        "-r" | "--remove" )
            if [[ -e "data.txt" ]]; then
                #lastline=`sed '$lines!d' data.txt
                #if [[ `lastline.substring(0,10)` == $today ]]; then
                    #sed '$lines!g' 1!0 data.txt     #replace 1 with 0 at last line
                #else
                    echo "You didn't work today."
                #fi
            fi
            print
            ;;
        * | "-h" | "--help" )
            help
    esac
else
    print
fi