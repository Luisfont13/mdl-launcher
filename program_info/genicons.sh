#!/bin/bash

# ICO (Windows)

inkscape -w 16 -h 16 -o mdllauncher_16.png com.mdl-launcher.mdl-launcher.svg
inkscape -w 24 -h 24 -o mdllauncher_24.png com.mdl-launcher.mdl-launcher.svg
inkscape -w 32 -h 32 -o mdllauncher_32.png com.mdl-launcher.mdl-launcher.svg
inkscape -w 48 -h 48 -o mdllauncher_48.png com.mdl-launcher.mdl-launcher.svg
inkscape -w 64 -h 64 -o mdllauncher_64.png com.mdl-launcher.mdl-launcher.svg
inkscape -w 128 -h 128 -o mdllauncher_128.png com.mdl-launcher.mdl-launcher.svg

convert mdllauncher_128.png mdllauncher_64.png mdllauncher_48.png mdllauncher_32.png mdllauncher_24.png mdllauncher_16.png mdllauncher.ico

rm -f mdllauncher_*.png

# ICNS (macOS)

inkscape -w 1024 -h 1024 -o mdllauncher_1024.png com.mdllauncher.mdllauncher.bigsur.svg

mkdir mdllauncher.iconset

sips -z 16 16     mdllauncher_1024.png --out mdllauncher.iconset/icon_16x16.png
sips -z 32 32     mdllauncher_1024.png --out mdllauncher.iconset/icon_16x16@2x.png
sips -z 32 32     mdllauncher_1024.png --out mdllauncher.iconset/icon_32x32.png
sips -z 64 64     mdllauncher_1024.png --out mdllauncher.iconset/icon_32x32@2x.png
sips -z 128 128   mdllauncher_1024.png --out mdllauncher.iconset/icon_128x128.png
sips -z 256 256   mdllauncher_1024.png --out mdllauncher.iconset/icon_128x128@2x.png
sips -z 256 256   mdllauncher_1024.png --out mdllauncher.iconset/icon_256x256.png
sips -z 512 512   mdllauncher_1024.png --out mdllauncher.iconset/icon_256x256@2x.png
sips -z 512 512   mdllauncher_1024.png --out mdllauncher.iconset/icon_512x512.png
cp mdllauncher_1024.png mdllauncher.iconset/icon_512x512@2x.png

iconutil -c icns mdllauncher.iconset

rm -f mdllauncher_*.png
rm -rf mdllauncher.iconset

# Linux icon propagation

for dir in ../launcher/resources/*/scalable
do
    cp -v com.mdl-launcher.mdl-launcher.svg "$dir/launcher.svg"
done
