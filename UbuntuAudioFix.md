

# Ubuntu Audio Fixes

## Bluetooth

### Disabling the AVRCP plugin

1. Open a terminal and paste this in `sudo gedit /lib/systemd/system/bluetooth.service`
2. Press this key combo `ctrl + f` to open the finder and find this line `ExecStart=/usr/lib/bluetooth/bluetoothd`
3. Add this to the end of the line: `--noplugin=avrcp`
4. Save the file, and close it. 
5. In the terminal, run these commands: `sudo systemctl daemon-reload && sudo systemctl restart bluetooth`

### Disabling the A2DP plugin

1. Open a terminal and paste this in `sudo gedit /lib/systemd/system/bluetooth.service`
2. Press this key combo `ctrl + f` to open the finder and find this line `ExecStart=/usr/lib/bluetooth/bluetoothd`
3. Add this to the end of the line: `--noplugin=a2dp`
4. Save the file, and close it. 
5. In the terminal, run these commands: `sudo systemctl daemon-reload && sudo systemctl restart bluetooth`

### Using D-Bus to interact with BlueZ

1. Click on your upper right hand corner to bring down the dropdown menu. 
2. Click on the `Bluetooth` tab and click on `Bluetooth Settings`to open up the Bluetooth devices menu.
3. Click on your Bluetooth device from the list that pops up.
4. Copy the MAC address which would look like this `F1:8D:AF:30:9F:C9`
5. Open a terminal.
6. 
7. Run this command `dbus-send --print-reply --system --dest=org.bluez /org/bluez/hci0/dev_<mac_address_of_headphones> org.bluez.MediaControl1.VolumeUp` 