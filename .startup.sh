nohup nm-applet &
nohup compton -b &
nohup haproxy -f /home/$USER/.haproxy.cfg &
nohup sslocal -c /home/$USER/.ss.json &
nohup /home/$USER/.screenlayout/vertical.sh &
proxychains python /home/$USER/scripts/wallpaper.py
feh --bg-fill /home/$USER/Pictures/wallpaper/`ls /home/$USER/Pictures/wallpaper/ -t | head -n 1` &
echo xqm | sudo --stdin ls &
echo xqm8992249,,, | nohup sudo openconnect -u 51184501170 --passwd-on-stdin vpn-ct.ecnu.edu.cn &
nohup guake &
nohup synergy &
nohup artha &
nohup xfce4-clipman &
