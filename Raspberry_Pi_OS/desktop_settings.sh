## Add Panel Widget
echo "
Plugin {
  type=monitors
  Config {
    DisplayCPU=1
    DisplayRAM=1
    CPUColor=#0000FF
    RAMColor=#FF0000
  }
}
Plugin {
  type=cputemp
  Config {
  }
}" >> /home/pi/.config/lxpanel/LXDE-pi/panels/panel

sed -i 's/XKBLAYOUT=gb/XKBLAYOUT=it/g' /etc/default/keyboard

# refresh panel
lxpanelctl restart
