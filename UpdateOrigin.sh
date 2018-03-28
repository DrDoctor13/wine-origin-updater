#!/bin/bash

echo "Downloading latest Origin setup file"

sleep 1

wget "https://download.dm.origin.com/origin/live/OriginSetup.exe"

echo "Extracting to .zip file"

sleep 1

unzip OriginSetup.exe 'update/*.zip'

sleep 1

echo "Enter Origin installation directory"

read path

unzip -o ./update/*.zip -d $path

echo "Cleaning up..."

sleep 1

rm -r ./update
rm OriginSetup.exe

echo "Done!"
