# Linux

## Ubuntu/Mint Tips

Goto [easylinuxtips](https://easylinuxtipsproject.blogspot.com/p/1.html) and follow the guides.

## Changing Windows Cursors for Ubuntu

1. Find the .cur and .ani files you want to use.
2. Put them in a folder.
3. Open this: [CursorCreate](https://github.com/isaacrobinson2000/CursorCreate/releases)
4. Alternatively, open this: CursorCreateWindows.zip from the Utilities folder (either external harddrive or from sakae-crypt or kenji-crypt) OR this folder [CursorCreate](/home/tatsuei/Downloads/CursorCreate)
5. Run the program according to the README file.
6. Use the template provided for a quickstart.
7. ***Use the latest release for newer Ubuntu distros***, if not you could try the older releases too!

## Changing the lockscreen background (Ubuntu 20.04)

### Note: GDM3 won't accept filenames with spaces!!! Change filenames to include dashes ( - ) or underscores ( _ ) to work with filenames with spaces :)

1. In a terminal, type `sudo apt install libglib2.0-dev-bin` and press Return/Enter.
2. Then type `curl -L -O github.com/thiggy01/ubuntu-20.04-change-gdm-background/raw/master/ubuntu-20.04-change-gdm-background` or `curl -L -O github.com/ttsuei/ubuntu-20.04-change-gdm-background/raw/master/ubuntu-20.04-change-gdm-background` if the first one doesn't work anymore.
3. Type ` chmod +x ubuntu-20.04-change-gdm-background` to make the script executable.
4. set the wallpaper with `sudo ./ubuntu-20.04-change-gdm-background /location/of/wallpaper.jpg` ***Change "wallpaper" to the name of your image!
5. It would ask if you would like to restart the GDM service, so type `Y`. If it doesn't, type `systemctl restart gdm.service` to restart it manually.
6. Wait for a bit and BOOM! You got yoself a nice new lockscreen :D

## Shortcuts (Ubuntu 20.04)

### Moving Windows between Workspaces

1. Ctrl + Alt + Arrowkey to switch between workspaces
2. Ctrl + Alt + Shift + Arrowkey to move the current window between workspaces

### Custom Key Mappings

1. Alt + 1 - Firefox
2. Alt + 2 - Brave
3. Alt + 3 - Typora
4. Alt + M - Music (Foobar2000)

## Printing SysInfo

1. Install `neofetch` if you haven't done yet! Here's [a link](https://github.com/dylanaraps/neofetch/wiki/Installation#universal-install) to the instructions! Or you could follow the steps below.

### Ubuntu 17.04 and up

1. Update yo repositories! `sudo apt update`
2. Get that stuff in you! `sudo apt install neofetch`

### Ubuntu 16.10 and below

1. Add the official PPA! `sudo add-apt-repository ppa:dawidd0811/neofetch`
2. Update yo repositories! `sudo apt update`
3. Get that stuff in you! `sudo apt install neofetch`

## Installing fonts

1. Download your desired fonts, and extract them out of the ZIP file(s) if necessary.
2. Double click each of them and press *Install* for each .ttf or .otf file.
3. Open a terminal, and type `fc-cache -f -v`
4. Enjoy your new fonts!

## Missing System Tray Icons?

1. Install one of these two: [TopIcons Plus](https://extensions.gnome.org/extension/1031/topicons/) or [KStatusNotifierItem/AppIndicator Support](https://extensions.gnome.org/extension/615/appindicator-support/) either from source (on Github) or from the Gnome Extensions page.

## Auto-connect Bluetooth Devices Ubuntu

**Note:**
This has been tested on my `Galaxy Buds` OS: `Ubuntu 20.04` as of 8th May 2020.

Try pairing your BT device and computer. Once they're paired, follow the steps below: 

1. Open Terminal and run `bluetoothctl`
2. The output would be something like this:

```
tatsuei@eijihaus:~$ bluetoothctl
[NEW] Controller xx:xx:xx:xx:xx:xx [default]
[NEW] Device aa:bb:cc:dd:ee:ff Galaxy Buds (4FB9)
Agent registered
[bluetooth]# 
```

3. In the above output "Galaxy Buds (4FB9)" is paired but not yet connected.. So to connect to this device we do: `connect aa:bb:cc:dd:ee:ff` at the prompt `[bluetooth]#` with `aa:bb:cc:dd:ee:ff` as your BT device address.

Example:

```
[bluetooth]# connect aa:bb:cc:dd:ee:ff
Attempting to connect to aa:bb:cc:dd:ee:ff
[CHG] Device aa:bb:cc:dd:ee:ff Connected: yes
Connection successful
[CHG] Device aa:bb:cc:dd:ee:ff ServicesResolved: yes
[Galaxy Buds (4FB9)]#
```

This means if you can run the command `bluetoothctl` and then at the `[bluetooth]#` prompt if you can input `connect aa:bb:cc:dd:ee:ff` The Bluetooth Device will connect.

So this can be done with a single command in terminal like this, after your first login open Terminal and run this command.

```
echo "connect aa:bb:cc:dd:ee:ff" | bluetoothctl
```

Example:

```
tatsuei@eijihaus:~$ echo "connect aa:bb:cc:dd:ee:ff" | bluetoothctl
[NEW] Controller xx:xx:xx:xx:xx:xx i7-4770 [default]
[NEW] Device aa:bb:cc:dd:ee:ff Galaxy Buds (4FB9)
Agent registered
[bluetooth]# connect aa:bb:cc:dd:ee:ff
Attempting to connect to aa:bb:cc:dd:ee:ff
Agent unregistered
[DEL] Controller xx:xx:xx:xx:xx:xx [default]
tatsuei@eijihaus:~$
```

so the command `echo "connect aa:bb:cc:dd:ee:ff" | bluetoothctl` is working..

This means if we can run this command at login without human  interaction.. the BT device which is paired and already turned on at the time of boot will connect in the above manual way..

------

4. `mkdir ~/bin` (Create this directory if you dont have already.. Otherwise Ignore this step)
5. `touch ~/bin/btautoconnect.sh` 
6. `gedit ~/bin/btautoconnect.sh` and paste this: 

```
#!/bin/bash

bluetoothctl
sleep 10
echo "connect aa:bb:cc:dd:ee:ff" | bluetoothctl
sleep 12
echo "connect aa:bb:cc:dd:ee:ff" | bluetoothctl
exit
```

7. Save the file, and then exit the editor.

8. Set the executable permission for this script: `chmod +x ~/bin/btautoconnect.sh`

9. Create a .desktop file named `btautoconnect.desktop` in `~/.config/autostart/` 
10. `touch ~/.config/autostart/btautoconnect.desktop` 
11. Edit the file, `gedit ~/.config/autostart/btautoconnect.desktop`, and paste the following into the file.

```
[Desktop Entry]
Type=Application
Exec=/home/tatsuei/bin/btautoconnect.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=BTAutoConnect
X-GNOME-Autostart-Delay=5
Comment=Connects to Galaxy Buds
```

12. Save the file, and then exit the editor.
13. Reboot your computer, and see the magic happen(?) :)

## DeadBeeF Custom Layout

[deadbeef Arc Darker Theme](/home/tatsuei/Downloads/deadbeef-arc-darker-theme.txt)

## Minimal Firefox userChrome style

[Minimal Functional Fox](https://github.com/mut-ex/minimal-functional-fox) or [Minimal Functional Fox (Fork)](https://github.com/tatsuei/minimal-functional-fox)

## Tutorial for creating userChrome styles for Firefox

Since there is no real help or documentation how to style the new Firefox  Beta 57 I found a way how to live-debug the userChrome.css file.

Create the userChrome.css

1. [Enable userChrome.css support in Fx v69+](https://www.reddit.com/r/FirefoxCSS/comments/brmi8v/psa_firefox_v69_users_will_have_to_set_a_pref_to/)
2. Open about:support
3. Click on "Profile Folder" -> "Open Folder"
4. Create a sub-folder named "chrome"
5. Change into the new folder
6. Create a file named "userChrome.css"
7. Add some rules
8. Restart Firefox

Live-Testing styles

Pre-setup

Before being able to try styles, you need to enable two developer options (only do this once). To do that:

1. Press Ctrl + Shift + I on Win/Linux or Cmd + Opt + I on Mac
2. Click on the cog that appears in a right or left top corner, next to other buttons.
3. Scroll down to Advanced Settings and check the settings "Enable browser chrome and add-on debugging toolboxes" and "Enable remote debugging".
4. Close the developer tools panel and proceed with next tutorial

Testing a style

1. Press Ctrl + Alt + Shift + I on Win/Linux or Cmd + Opt + Shift + I on Mac
2. A permission dialog will prompt you to allow remote debug, accept
3. Click on the tab Style Editor, choose file userChrome.css on the sidebar
4. Choose the style you want to preview from this repository, copy the code
5. Scroll down on the development tools window textbox, paste the code
6. You should see the style being applied. If you like what you see, you can  click Save, otherwise it will disappear after restarting the browser.

Styling Context Menus / Popups

from [/u/DanTheMan74](https://www.reddit.com/u/DanTheMan74/)
The Firefox dev tools, when they're opened for remote debugging of the  browser content, have an extra option that's hidden behind the dropdown  at the top right, a thing which many people have no clue about.

The toggle is called Disable Popup Auto-Hide and it does exactly what it  says. By default Firefox (popup) menus disappear when you use the  element picker, but you can make them stay around by activating this  setting. This makes finding elements and their ids or classes much  simpler.

Reference:
https://developer.mozilla.org/en-US/docs/Tools/Browser_Toolbox
https://developer.mozilla.org/en-US/docs/Tools/Style_Editor