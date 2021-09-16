# Install Rclone as a Windows Service

First go to this website: https://nssm.cc/ and download NSSM.

Copy nssm.exe to same directory that rclone is in. Press this combo: Windows key + S to bring up the search bar and type `cmd`. Press this combo: Ctrl + Shift + Enter to open an Admin privileges CMD window.

1. `cd c:\rclone` (or wherever you have rclone located)

2. `nssm install “yourservicename”` <- the name inside the quotes can be changed to whatever you like 

3. Fill in the info below, press install.

   `Application` tab:
   Path: `C:\rclone\rclone.exe`
   Startup Directory: `C:\rclone`
   Arguments: `mount gdrive-crypt: s: --config "C:\folder\where\your\rclone.conf"`<- change this directory to match your own CONF file.
   Service name: yourservicename <- again, this can be changed

   `Details` tab:
   Display name: yourservicename <- change this if needed
   Description: Automatically mounts the encrypted <your drive here> using rclone.

   `Exit` actions tab:
   Delay restart by: 10000 ms (10 seconds)

4. Still in the command prompt, type `services.msc`. Scroll down and choose your service (e.g: `yourservicename`) and right click and start it.

5. If it fails to start, stop the service. Do this by right clicking the process name, and select "Stop service".

6. Go back to command prompt and run the following line `sc.exe delete “yourservicename”`

7. Repeat steps 2 to 5 to troubleshoot any errors.

Going to post the various parts of NSSM that I’ve filled in. Originally it was failing because when I did the copy paste, 
for some reason it was doing one dash and one hyphen. I could paste it to command line and it would work. 
But to NSSM it would change it to hyphen. So I ended up just typing it out, instead of copy paste.

If I didn’t reference it above, I didn’t change it away from defaults.