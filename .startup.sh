nm-applet &
compton -b &
haproxy -f /home/$USER/.haproxy.cfg &
sslocal -c /home/$USER/.ss.json &
/home/$USER/.screenlayout/vertical.sh &
proxychains python /home/$USER/scripts/wallpaper.py
feh --bg-fill /home/$USER/Pictures/wallpaper/`ls /home/$USER/Pictures/wallpaper/ -t | head -n 1` &
echo xqm | sudo --stdin ls &
echo xqm8992249,,, | nohup sudo openconnect -u 51184501170 --passwd-on-stdin vpn-ct.ecnu.edu.cn &
guake &
synergy &
artha &
xfce4-clipman &
