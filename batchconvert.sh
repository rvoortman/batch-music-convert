#!/bin/bash

QUALITY=4
# Functions
# Check if lame is installed
function checklame {
    if hash lame 2>/dev/null; then
	echo Lame installed....        
    else
        echo You do not have Lame installed. Install that first!
	exit 1
    fi
}

# Count the amount of files that needs to be converted
function countfiles {
	echo Counting files....
	FILES=$(find . -not -path '*_converted.mp3' -name '*.mp3' -type f | wc -l)
	echo Starting to convert $FILES files! 
}

# Start logic
echo =========================================
echo               Initialising....
echo =========================================

echo Determining conversion quality...
if [[ -n $1 ]]; then
	QUALITY=$1
fi
echo Quality determined $QUALITY
checklame
countfiles

echo =========================================
echo                Converting....
echo =========================================

find . -not -path '*_converted.mp3' -name '*.mp3' -type f -exec bash -c 'echo Converting $0 .... && lame "$0" -V'$QUALITY' "${0%.mp3}_converted.mp3" --quiet && rm "$0"' {} \;

echo =========================================
echo                   Done!
echo =========================================





