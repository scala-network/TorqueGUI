#!/bin/sh
cp build/release/bin/stellite-wallet-gui.app/Contents/Frameworks/libicudata.63.1.dylib build/release/bin/stellite-wallet-gui.app/Contents/Frameworks/libicudata.63.dylib
cd build/release/bin/
tar -zcvf StelliteGUI_MacOS.tar.gz stellite-wallet-gui.app
cd ../../../
echo 'The MacOS GUI wallet is at build/release/bin/StelliteGUI_MacOS.tar.gz' 
