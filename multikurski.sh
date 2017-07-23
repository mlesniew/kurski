#!/bin/bash

set -e

LIST=$(curl -s "$1" |
    tr '\n' ' ' |
    grep -Po 'href=".*?"' |
    cut -d'"' -f2 |
    grep '^/video' |
    xargs -n1 printf "https://vod.tvp.pl%s\n")

GET=$(dirname "$0")/kurski.sh

for URL in $LIST
do
    "$GET" "$URL"
done

