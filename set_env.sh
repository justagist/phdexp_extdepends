#! /bin/bash

#
# Adds directories in current folder to pythonpath if python files exist in it
#

CURR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIRS_IN_PATH=`ls -d $CURR_PATH/*/`

for d in $DIRS_IN_PATH
do
    if [ -d "$d" ]; then
        if [ d[-1]=='/' ]; then
            d=${d::-1}
        fi
        echo -e "\nFound directory: ${d##*/}"
        count=`ls -1 $d/*.py 2>/dev/null | wc -l`
        if [ $count != 0 ]
        then 
            echo -e "Found python file in ${d##*/}. Adding directory to python path.\n"
            export PYTHONPATH=$d:$PYTHONPATH
        fi 
    fi
done
