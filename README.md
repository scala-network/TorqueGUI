# Stellite GUI

Copyright (c) 2017-2018, The Stellite Project

Copyright (c) 2014-2017, The Monero Project

## Development Resources

- Web: [stellite.cash](https://stellite.cash)
- Discord: [https://discord.gg/C9JVYHA](https://discord.gg/C9JVYHA)
- Mail: [admin@stellite.cash](mailto:admin@stellite.cash)
- Github: [https://github.com/stellitecoin/StelliteGUI/](https://github.com/stellitecoin/StelliteGUI/)

## Introduction

Stellite is a private, secure, untraceable, decentralised digital currency. You are your bank, you control your funds, and nobody can trace your transfers unless you allow them to do so.

**Privacy:** Stellite uses a cryptographically sound system to allow you to send and receive funds without your transactions being easily revealed on the blockchain (the ledger of transactions that everyone has). This ensures that your purchases, receipts, and all transfers remain absolutely private by default.

**Security:** Using the power of a distributed peer-to-peer consensus network, every transaction on the network is cryptographically secured. Individual wallets have a 25 word mnemonic seed that is only displayed once, and can be written down to backup the wallet. Wallet files are encrypted with a passphrase to ensure they are useless if stolen.

**Untraceability:** By taking advantage of ring signatures, a special property of a certain type of cryptography, Stellite is able to ensure that transactions are not only untraceable, but have an optional measure of ambiguity that ensures that transactions cannot easily be tied back to an individual user or computer.

## About this Project

This is the GUI for the [core Stellite implementation](https://github.com/stellitecoin/stellite). It is open source and completely free to use without restrictions, except for those specified in the license agreement below. There are no restrictions on anyone creating an alternative implementation of Stellite that uses the protocol and network in a compatible manner.

As with many development projects, the repository on Github is considered to be the "staging" area for the latest changes. Before changes are merged into that branch on the main repository, they are tested by individual developers in their own branches, submitted as a pull request, and then subsequently tested by contributors who focus on testing and code reviews. That having been said, the repository should be carefully considered before using it in a production environment, unless there is a patch in the repository for a particular show-stopping issue you are experiencing. It is generally a better idea to use a tagged release for stability.

## Supporting the Project

Stellite development can be supported directly through donations.

Both Stellite and Bitcoin donations can be made to donate.getstellite.org if using a client that supports the [OpenAlias](https://openalias.org) standard

The Stellite donation address is: `Se321oJNkfaGrN89Vmq6qGZb8587L53u2NVZbCrhhJujemaGMVNmr952oEsQAKGFojevSWDNcJK8GS8Sy4manyrG2okoPyvfa`

The Bitcoin donation address is: `1STLDjXKsQdCBRwHjBEeNVF4aH1N96nyx`

## License

See [LICENSE](LICENSE).

## Compiling StelliteGUI in a VM

Make sure you have more then 8GB RAM in the virtual machine for a proper compile.

## Compiling StelliteGUI from Source

### On Linux:

(Tested on Ubuntu 18.04 LTS x64, 16.04 x86, 16.10 x64, Gentoo x64 and Linux Mint 18 "Sarah" - Cinnamon x64)

1. Install Stellite dependencies

  - For Ubuntu and Mint

	`sudo apt install git-all build-essential cmake libboost-all-dev miniupnpc libpcsclite-dev libzmq3-dev libminiupnpc-dev libunbound-dev graphviz doxygen libunwind8-dev pkg-config libssl-dev`

  - For Gentoo

	`sudo emerge dev-vcs/git app-arch/xz-utils app-doc/doxygen dev-cpp/gtest dev-libs/boost dev-libs/expat dev-libs/openssl dev-util/cmake media-gfx/graphviz net-dns/unbound net-libs/ldns net-libs/miniupnpc net-libs/zeromq sys-libs/libunwind`

2. Grab an up-to-date copy of the stelliteGUI repository

	`git clone --recursive https://github.com/stellitecoin/StelliteGUI.git`

3. Go into the repository

	`cd stelliteGUI`

4. Install the GUI dependencies

  *Note*: Qt 5.7 is the minimum version required to build the GUI. This makes **some** distributions (mostly based on debian, like Ubuntu 16.x or Linux Mint 18.x) obsolete. You can still build the GUI if you install an [official Qt release](https://wiki.qt.io/Install_Qt_5_on_Ubuntu), but this is not officially supported.

  - For Ubuntu 17.10+

    `sudo apt install qtbase5-dev qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtquick-controls2 qml-module-qtquick-dialogs qml-module-qtquick-xmllistmodel qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel qttools5-dev-tools`

  - For Ubuntu 16.04 x86

	`sudo apt-get install qtbase5-dev qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtquick-xmllistmodel qttools5-dev-tools qml-module-qtquick-dialogs`

  - For Ubuntu 16.04+ x64

    `sudo apt-get install qtbase5-dev qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtquick-xmllistmodel qttools5-dev-tools qml-module-qtquick-dialogs qml-module-qt-labs-settings qml-module-qtgraphicaleffects`   

  - For Linux Mint 18 "Sarah" - Cinnamon x64

    `sudo apt install qml-module-qt-labs-settings qml-module-qtgraphicaleffects`

  - For Gentoo

    `sudo emerge dev-qt/qtcore:5 dev-qt/qtdeclarative:5 dev-qt/qtquickcontrols:5 dev-qt/qtquickcontrols2:5 dev-qt/qtgraphicaleffects:5`

  - Optional : To build the flag `WITH_SCANNER`

    - For Ubuntu and Mint

      `sudo apt install qtmultimedia5-dev qml-module-qtmultimedia libzbar-dev`

    - For Gentoo

      The *qml* USE flag must be enabled.

      `emerge dev-qt/qtmultimedia:5 media-gfx/zbar`

5. Build the GUI

  - For Ubuntu and Mint

	`./build.sh release-static`

  - For Gentoo

    `QT_SELECT=5 ./build.sh`
    
6. cd build and make deploy

`cd build`

`make deploy`

The executable can be found in the build/release/bin folder.

### On OS X:

1. Install or update Xcode from the AppStore
2. Install [homebrew](http://brew.sh/) via the Terminal
3. Install [stellite](https://github.com/stellitecoin/stellite) dependencies via the Terminal:

  `brew install git`
  
  `brew install boost --c++11`

  `brew install openssl` - to install openssl headers

  `brew install pkgconfig`

  `brew install cmake`
  
  `brew install unbound`

  `brew install miniupnpc`

  `brew install zeromq`

  `brew install doxygen`

  `brew install pcsc-lite`

  `brew install qt5`  (or download QT 5.8+ from [qt.io](https://www.qt.io/download-open-source/))

  If you have an older version of Qt installed via homebrew, you can force it to use 5.x like so:
  
  `brew link --force --overwrite qt5`

5. Add the Qt bin directory to your path

    Example: `export PATH=$PATH:$HOME/Qt/5.8/clang_64/bin`
    
    Example: `export PATH=$PATH:/usr/local/Cellar/Qt/5.11.1/bin`

    This is the directory where Qt 5.x is installed on **your** system

6. Grab an up-to-date copy of the stelliteGUI repository

  `git clone --recursive https://github.com/stellitecoin/StelliteGUI.git`

7. Go into the repository

  `cd stelliteGUI`

8. Start the build

  `./build.sh release-static`
  
9. When its done compiling

`cd build`

10. time to make a deploy

`make deploy`

The executable can be found in the `build/release/bin` folder.

**Note:** Workaround for "ERROR: Xcode not set up properly"

Edit `$HOME/Qt/5.8/clang_64/mkspecs/features/mac/default_pre.prf`

replace
`isEmpty($$list($$system("/usr/bin/xcrun -find xcrun 2>/dev/null")))`

with
`isEmpty($$list($$system("/usr/bin/xcrun -find xcodebuild 2>/dev/null")))`

More info: http://stackoverflow.com/a/35098040/1683164


### On Windows:

1. Install [MSYS2](https://www.msys2.org/), follow the instructions on that page on how to update system and packages to the latest versions

2. Open an 64-bit MSYS2 shell: Use the *MSYS2 MinGW 64-bit* shortcut, or use the `msys2_shell.cmd` batch file with a `-mingw64` parameter

3. Install MSYS2 packages for StelliteGUI dependencies; the needed 64-bit packages have `x86_64` in their names

    ```
    pacman -S git-core mingw-w64-x86_64-libpsl mingw-w64-x86_64-toolchain make mingw-w64-x86_64-cmake mingw-w64-x86_64-boost mingw-w64-x86_64-openssl mingw-w64-x86_64-zeromq mingw-w64-x86_64-libsodium mingw-w64-x86_64-miniupnpc pkg-config mingw-w64-x86_64-unbound
    ```
4. Install Qt5

    ```
    pacman -S mingw-w64-x86_64-qt5
    ```

    There is no more need to download some special installer from the Qt website, the standard MSYS2 package for Qt will do in almost all circumstances.


5. Close and then open the ```MSYS2 MinGW 64-bit``` shell

   ```%MSYS_ROOT%\msys2_shell.cmd --mingw64```

   ```c:\msys64``` if your host OS is x64-based

6. Clone repository
    ```
    cd
    git clone --recursive https://github.com/stellitecoin/StelliteGUI.git
    ```

7. Build the GUI
    ```
    cd StelliteGUI
    export PATH=$(ls -rd /mingw64/bin | head -1):$PATH
    export PATH=$(ls -rd /usr/bin | head -1):$PATH
    ./build.sh
    cd build
    make deploy
    ```

The executable can be found in the ```.\release\bin``` directory.


8. If you see errors with boost try to install the 1.66.0-2 version of boost, specificly the required static libraries
    ```
	wget http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-boost-1.66.0-2-any.pkg.tar.xz
	Pacman -U mingw-w64-x86_64-boost-1.66.0-2-any.pkg.tar.xz
	
    ```
