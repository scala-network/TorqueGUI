# Stellite GUI Wallet Beta 2 Windows Installer #

Copyright (c) 2014-2017, The Stellite Project

## Introduction ##

This is a *Inno Setup* script `Stellite.iss` plus some related files that
allows you to build a standalone Windows installer (.exe) for the
Stellite GUI Wallet Beta 2.

This turns the GUI Wallet into a more or less standard Windows program,
by default installed into a subdirectory of `C:\Program Files`, a
program group with some icons in the *Start* menu, and automatic
uninstall support. It helps lower the "barrier to entry" somewhat,
especially for less technically experienced users of Stellite.

As the setup script in file [Stellite.iss](Stellite.iss) has to list every
single file of the GUI Wallet package to install by name, this version
of the script only works with exactly the GUI Beta 2 that you find on
[the official download page](https://getstellite.org/downloads/).

But of course it will be easy to modify the script for future versions
of the GUI Wallet.

## License ##

See [LICENSE](LICENSE).

## Building ##

You can only build on Windows, and the result is always a Windows .exe
file that can act as a standalone installer for the GUI Wallet Beta 2.

The build steps in detail:

1. Install *Inno Setup*. You can get it from [here](http://www.jrsoftware.org/isdl.php)
2. Get the Inno Setup script plus related files by cloning the whole [stellite-core](https://github.com/stellitecoin/stellite-core) repository; you will only need the files in the installer directory  `installers\windows` however
3. The setup script is written to take the GUI Wallet files from a subdirectory named `bin`; so create `installers\windows\bin`, get the zip file of the GUI Wallet Beta 2 from [here](https://getstellite.org/downloads/), unpack it somewhere, and copy all the files and subdirectories in the `stellite-gui-0.10.3.1-beta2` directory to this `bin` subdirectory
4. Start Inno Setup, load `Stellite.iss` and compile it.
5. The result i.e. the finished installer will be the file `mysetup.exe` in the `installers\windows\Output` subdirectory 

