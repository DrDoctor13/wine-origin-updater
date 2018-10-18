#!/bin/bash

PATH32="drive_c/Program Files/Origin"
PATH64="drive_c/Program Files (x86)/Origin"
UPDATEPATH=""

update() {
    local DIR="$1"
    if which aria2c; then
        command="aria2c -x8 -c"
    else
        command="wget"
    fi
    echo "Downloading latest Origin setup file:"
    
    if $command "https://download.dm.origin.com/origin/live/OriginSetup.exe"; then
    echo "Extracting the installation file:"
        unzip OriginSetup.exe 'update/*.zip'
        unzip -o ./update/*.zip -d "$DIR"
        echo "Cleaning up..."
        rm -r ./update
        rm OriginSetup.exe
        echo "Done!"
    fi
}

if [[ ! -z "$WINEPREFIX" ]];
then

    # exit if no Origin folder can be found in the WINEPREFIX
    if [[ ! -e "$WINEPREFIX/$PATH32" ]] && [[ ! -e "$WINEPREFIX/$PATH64" ]];
    then
        echo "Origin not found in WINEPREFIX!"
        echo "Please run this script again with the correct WINEPREFIX"
        echo "or cd to your Origin directory and run the script there."
        exit 1
    fi

    # check which installation of Origin is present. If both are (dunno why), then 64bit is being used
    if [[ -e "$WINEPREFIX/$PATH32" ]];
    then
        UPDATEPATH=$PATH32
        echo "Found a 32bit installation of Origin, going to use this:"
    fi
    if [[ -e "$WINEPREFIX/$PATH64" ]];
    then
        UPDATEPATH=$PATH64
        echo "Found a 64bit installation of Origin, going to use this:"
    fi

    # ouput the folder, so that the user has confirmation
    echo "=> $WINEPREFIX/$UPDATEPATH"

    # now we do our magic!
    update "$WINEPREFIX/$UPDATEPATH"
    exit 0

fi
if [[ -z $WINEPREFIX ]]
then
    echo "WINEPREFIX not passed, checking working directory..."
    if [[ -w "$PWD/Origin.exe" ]];
    then
        update "$PWD"
        exit 0
    fi
    if [[ ! -w "$PWD/Origin.exe" ]];
    then
        echo "Origin.exe not found in working directory!"
        echo "Please enter your Origin installation path:"
        read -e path
        if [[ -w "$path/Origin.exe" ]];
        then
            update "$path"
        fi
        if [[ ! -w "$path/Origin.exe" ]];
        then
            echo "This path does not contain Origin.exe!"
        fi
    fi
fi
