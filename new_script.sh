#!/bin/bash

host="yahoo.com"
ping -c 1 $host

if [ "$?" -eq 0 ]; then
    echo "$host reachable."
else
    echo "$host unreachable."
fi


wowcher() {
    host="wowcher.co.uk"
    ping -c 1 $host > /dev/null
    if [ "$?" -eq 0 ]; then
        echo "$host is reachable."
    else
        echo "$host is unreachable."
    fi
}


google() {
    host="google.com"
    ping -c 1 $host > /dev/null
    if [ "$?" -eq 0 ]; then
        echo "$host is reachable."
    else
        echo "$host is unreachable."
    fi
}


gtbank() {
    host="gtbank.com"
    ping -c 1 $host > /dev/null
    if [ "$?" -eq 0 ]; then
        echo "$host is reachable."
    else
        echo "$host is unreachable."
    fi
}


case $1 in
    "wowcher")
        wowcher
        ;;
    "google")
        google
        ;;
    "gtbank")
        gtbank
        ;;
    *)
        echo "Usage: $0 {wowcher|google|gtbank}"
        ;;
esac