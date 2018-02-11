# Electroneum GUI Wallet

This is a fork of the **Sumokoin GUI Wallet**: https://github.com/sumoprojects/SumoGUIWallet
It is changed to be compatible with Electroneum.


1. Install dependencies (with Python 2.7):

	* Generally, you can use Python `pip` to install required components:
		
			pip install PySide, requests, psutil
	
	* or
			
			pip install -r requirements.txt 
	
	* On some OSes, PySide may be required to install from pre-built packages. For example, on Ubuntu 16.04, install PySide with the following command:
			
			sudo apt install python-pyside


2. Build/download Electroneum binaries from [Electroneum repo](https://github.com/electroneum/electroneum) and put it to `Resources/bin` sub-directory.

3. Run the wallet (Python 2.7):
		
		cd /path/to/SumoGUIWallet
		python wallet.py

4. Contribution

	Pull-requests and help is always welcome. If you want to buy me a beer:
	
	ETN: etnjwraRJzdMMDy5zMY1CEaKCHYqn73AvKzKj2MCtLfXDdzoFSQqKHwENYA4gjY7mhRRbko3rbed8JnQnVNrXukV33AymaJNkD
	
	BTC: 1FjP4tLe36p1fKGtkhJRx8713Gv94Nyjdb
	
	ETH: 0x4ab0363f6fa686fe28d3c9b7aaa6a7756ba2c4e2