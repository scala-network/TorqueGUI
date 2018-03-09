import sys
from cx_Freeze import setup,Executable

setup(
    name = "Stellite GUI",
    version = "0.0.2",
    options = {"build_exe": {"packages":["idna"]}},
    description = "A GUI for the Stellite Cryptocurrency",
    executables = [Executable("wallet.py", base = "Win32GUI")])
