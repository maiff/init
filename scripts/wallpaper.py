import requests
import getpass

username = getpass.getuser()
r = requests.get('http://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN')
body = r.json()
url = 'https://bing.com' + body['images'][0]['url']
img = requests.get(url)
open('/home/' + username + '/Pictures/wallpaper/' + body['images'][0]['startdate'] + '.jpg', "wb").write(img.content)
