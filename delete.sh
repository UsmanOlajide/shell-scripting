#!/bin/bash

echo What do you want to delete ?

read prompt

if [ -f $prompt ]; then
    rm $prompt
    echo "$prompt deleted successfully"
    exit
else
    if [ -d $prompt ]; then
        cd $prompt
        echo "Which file do you want to delete in $prompt"
        read file
        if [ -f $file ]; then
            rm $file
            echo "$file in $prompt deleted successfully"
        else
            echo "$file does not exist in $prompt"
        fi
        exit
    fi
    echo "$prompt does not exist"
fi
