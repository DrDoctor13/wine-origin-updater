#!/bin/bash

PATH32="drive_c/Program Files/Origin"
PATH64="drive_c/Program Files (x86)/Origin"

if [[ ! -z "$WINEPREFIX" ]];
then
    if [[ -e "$WINEPREFIX/$PATH32" ]];
    then
        echo "Downloading latest Origin setup file"
        wget "https://download.dm.origin.com/origin/live/OriginSetup.exe"
        echo "Extracting to .zip file"
        unzip OriginSetup.exe 'update/*.zip'
        unzip -o ./update/*.zip -d "$WINEPREFIX/$PATH32"
        echo "Cleaning up..."
        rm -r ./update
        rm OriginSetup.exe
        echo "Done!"
        exit 0
    fi
    if [[ -e "$WINEPREFIX/$PATH64" ]];
    then
        echo "Downloading latest Origin setup file"
        wget "https://download.dm.origin.com/origin/live/OriginSetup.exe"
        echo "Extracting to .zip file"
        unzip OriginSetup.exe 'update/*.zip'
        unzip -o ./update/*.zip -d "$WINEPREFIX/$PATH64"
        echo "Cleaning up..."
        rm -r ./update
        rm OriginSetup.exe
        echo "Done!"
        exit 0
    fi
    if [[ ! -e "$WINEPREFIX/$PATH32" ]] || [[ ! -e "$WINEPREFIX/$PATH64" ]];
    then
        echo "Origin not found in WINEPREFIX!"
        echo "Please run this script again with the correct WINEPREFIX"
        echo "or cd to your Origin directory and run the script there."
    fi
fi
if [[ -z $WINEPREFIX ]]
then
    echo "WINEPREFIX not passed, checking working directory..."
    if [[ -w "$PWD/Origin.exe" ]];
    then
        echo "Origin.exe found!"
        echo "Downloading latest Origin setup file"
        wget "https://download.dm.origin.com/origin/live/OriginSetup.exe"
        echo "Extracting to .zip file"
        unzip OriginSetup.exe 'update/*.zip'
        unzip -o ./update/*.zip -d "$PWD"
        echo "Cleaning up..."
        rm -r ./update
        rm OriginSetup.exe
        echo "Done!"
        exit 0
    fi
    if [[ ! -w "$PWD/Origin.exe" ]];
    then
        echo "Origin.exe not found in working directory!"
        echo "Please enter your Origin installation path:"
        read -e path
        if [[ -w "$path/Origin.exe" ]];
        then      
            echo "Downloading latest Origin setup file"
            wget "https://download.dm.origin.com/origin/live/OriginSetup.exe"
            echo "Extracting to .zip file"
            unzip OriginSetup.exe 'update/*.zip'
            unzip -o ./update/*.zip -d "$path"
            echo "Cleaning up..."
            rm -r ./update
            rm OriginSetup.exe
            echo "Done!"
        fi
        if [[ ! -w "$path/Origin.exe" ]];
        then
            echo "This path does not contain Origin.exe!"
        fi
    fi
fi