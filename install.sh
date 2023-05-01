sudo apt update
sudo apt install python3-gpiozero -y

line_to_add="python3 $(pwd)/shutdown-press-simple.py \&"
if sudo grep -q shutdown-press-simple.py /etc/rc.local; then
  sudo sed -i -E "s:^(.*shutdown-press-simple\.py.*)$:${line_to_add}:g" /etc/rc.local
else
  sudo sed -i -E "s:^(exit .*):${line_to_add}\n\1:" /etc/rc.local
fi
