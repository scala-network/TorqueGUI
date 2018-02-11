# -*- mode: python -*-

block_cipher = None


a = Analysis(['ElectroneumGUIWallet', 'wallet.py'],
             pathex=['C:\\Users\\franz\\Projekte\\ElectroneumGUIWallet'],
             binaries=[],
             datas=[('Resources', 'Resources')],
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          exclude_binaries=True,
          name='ame',
          debug=False,
          strip=False,
          upx=True,
          console=False , icon='Resources\\icons\\stellite_icon.ico')
coll = COLLECT(exe,
               a.binaries,
               a.zipfiles,
               a.datas,
               strip=False,
               upx=True,
               name='ame')
