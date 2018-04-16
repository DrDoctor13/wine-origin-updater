# wine-origin-updater
Origin doesn't like to update in Wine. This Bash script automatically downloads the newest update and will install it to your installation directory using `wget` and `unzip`.

# How to use:
- Make sure Origin is closed and not running in the background

## Method 1:
1. Download the bash file to any directory with write access.
2. Run the script with `WINEPREFIX=path/to/prefix updateorigin.sh`
3. Let the script complete and launch Origin.

## Method 2:
1. Download the bash file to your Origin installation directory.
2. Open a terminal in the directory and run the file. You do not need to pass WINEPREFIX.
3. Let the script complete and launch Origin.

## Method 3:
1. Download the bash file to any directory with write access.
2. Run the script through a terminal window and enter your Origin installation directory when prompted.
3. Let the script complete and launch Origin.
