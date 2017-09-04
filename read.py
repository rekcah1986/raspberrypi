from baidu_tts import BaiduTTS
import os
import sys
 
APP_ID =  '8932722'
API_KEY = 'og25ZUOIdMamTMP7Uqf3NPCq'
SECRET_KEY = '3cc188a371ec6ae962c26a08f112a733'
tts = BaiduTTS(API_KEY, SECRET_KEY)
sound_buffer = tts.say(sys.argv[1])

sound_buffer.write('audio.mp3')
#os.system('mplayer -q "audio.mp3"')
os.system('mpg123 -q audio.mp3 && rm audio.mp3')
