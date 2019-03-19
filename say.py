# -*- coding: utf-8 -*- 

import os
import sys
from aip import AipSpeech
APP_ID =  '8932722'
API_KEY = 'og25ZUOIdMamTMP7Uqf3NPCq'
SECRET_KEY = '3cc188a371ec6ae962c26a08f112a733'

client = AipSpeech(APP_ID, API_KEY, SECRET_KEY)
#text = unicode(sys.argv[1], 'utf-8')
text = sys.argv[1]
result  = client.synthesis(text, 'zh', 1, {
    'vol': 5,
    'per': 4,
})

if not isinstance(result, dict):
    with open('audio.mp3', 'wb') as f:
        f.write(result)
        f.close()
        os.system('sudo mplayer audio.mp3')
	os.remove('audio.mp3')
