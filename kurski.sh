#!/bin/bash

set -e

TITLE=$(curl -s "$1" |
    tr '\n' ' ' |
    grep -Po "<meta.*?/>" |
    grep -F 'itemprop="name"' |
    grep -Po 'content=".*?"' |
    cut -d'"' -f2 |
    tr ' ' '_' |
    tr -cd '[:alnum:]_.-')

FRAME_1=$(curl -s "$1" |
    tr '\n' ' ' |
    grep -Poi '<iframe.*?</iframe>' |
    grep -Po 'src=".*?"' |
    cut -d'"' -f2 |
    grep -E 'vod.tvp.pl')

FRAME_2='https://vod.tvp.pl'$(curl -s "$FRAME_1" |
    tr '\n' ' ' |
    grep -Poi '<iframe.*?</iframe>' |
    grep -Po 'src=".*?"' |
    cut -d'"' -f2)

VIDEO=$(curl -s "$FRAME_2" |
    tr '\n' ' ' |
    grep -Po "src:'https://.*?'" |
    cut -d"'" -f2 |
    grep '.mp4$')

echo TIT: $TITLE
echo URL: $VIDEO

wget -t5 -c -O "$TITLE.mp4" "$VIDEO"

