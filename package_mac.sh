#!/bin/sh
cp build/release/bin/torque-wallet-gui.app/Contents/Frameworks/libicudata.63.1.dylib build/release/bin/torque-wallet-gui.app/Contents/Frameworks/libicudata.63.dylib
cd build/release/bin/
tar -zcvf TorqueGUI_MacOS.tar.gz torque-wallet-gui.app
cd ../../../
echo 'The MacOS GUI wallet is at build/release/bin/TorqueGUI_MacOS.tar.gz' 
