#!/usr/bin/python
# -*- coding: utf-8 -*-
## Copyright (c) 2017, The Sumokoin Project (www.sumokoin.org)
'''
App top-level settings
'''

__doc__ = 'default application wide settings'

import sys
import os
import logging

from utils.common import getHomeDir, makeDir

USER_AGENT = "Stellite GUI Wallet"
APP_NAME = "Stellite Wallet"
VERSION = [0, 0, 2]


_data_dir = makeDir(os.path.join(os.getcwd(), 'data'))
DATA_DIR = _data_dir

log_file  = os.path.join(DATA_DIR, 'logs', 'app.log') # default logging file
log_level = logging.DEBUG # logging level

seed_languages = [("1", "English"), 
                  ("0", "German"), #Deutsch
                  ("2", "Spanish"),  #Español
                  ("3", "Francais"), #Français
                  ("4", "Italian"), #Italiano
                  ("5", "Dutch"), #Nederlands
                  ("6", "Portuguese"), #Português
                  ("7", "Russian"), #русский языкês
                  ("8", "Japanese"), #日本語
                  ("9", "Chinese"), #简体中文 (中国)
                  ("10", "Esperanto"),
                ]

# COIN - number of smallest units in one coin
COIN = 100.0

WALLET_DAEMON_PORT = 20188
RPC_DAEMON_PORT = 20189
