# Habit helper

By Haroen Viaene

This is a simple shell script that you use to keep track of good habits like studying. You open the script on a day after you've done whatever you were planning to do that day (i.e. study some chapter, or revise a lesson). The script will then keep the date when started tracking and how much consecutive days you've been doing the things in a file. It will then print a table with the days you've done 'it', and also two consecutive days, in a way to make sure a single miss doesn't result in a complete failure.

# Usage

`./habithelper.sh` will print a table of when you've done the thing and when you didn't. It will also show a table of two consecutive days. 

`./habithelper.sh -i` or `./habithelper.sh --init` will initialise a `data.txt`-file, in which the days worked and days not worked will be stored, as well as the day traking started.

`./habithelper.sh -a` or `./habithelper.sh --add` will add the current day as one you worked.

`./habithelper.sh -r` or `./habithelper.sh --remove` will remove the current day as one you worked

# Screenshots

Todo

# License

CC0 - public domain