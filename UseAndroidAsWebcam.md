## Using Android phone as a webcam 

[
![User avatar](https://styles.redditmedia.com/t5_1iaufa/styles/profileIcon_snoo910a2fd2-ece8-45f7-bca6-5d48a313dc12-headshot.png?width=256&height=256&crop=256:256,smart&s=84568c0f4c9652cfe23fe517eae895c25ef9d621)](https://www.reddit.com/user/chi11estpanda/)

level 1

[chi11estpanda](https://www.reddit.com/user/chi11estpanda/)·[1y](https://www.reddit.com/r/Twitch/comments/g2zmjq/best_way_to_use_android_phone_as_webcam_on_pc/fnokrxz/?utm_source=reddit&utm_medium=web2x&context=3)

~TL/DR~

1. The best alternative I'd recommend over Droidcam (but does not offer USB function) would be Ip Webcam by Pavel Khlebovich because it lets you control the video size/quality and the free version's watermark only appears in recordings made through the app and does not appear if you broadcast the video feed to your PC and recorded from the PC instead. Since there's not a USB connectivity feature, you can combine it with another software (later listed) to have the PC recognize the wifi broadcasted video as a webcam.
2. You can using a screen capture software for the phone such as Samsung Flow or Samsung SideSync and use the phone to call. Both Apps mention work either by connecting through USB or by Wifi.

\-------

Original Post

Is there a reason you particularly want to use USB? Would you be open to using WiFi instead?

If not, I've found it to suit my needs by

1. Running a [personal nginx server](https://youtu.be/1qH2bo7NHzg?t=154) (with RTMP) on the PC that would act as the streaming PC, *(Realized an alternative after nearly completing the post, see it after "Finally")*
2. Using Streamlabs on my phone (Galaxy S8+) to broadcast to a custom RTMP server).
3. You can set up Streamlabs to capture your screen as well as the camera (at least I can on my S8+ so I imagine your regular S8 should be able to do the same) and do it at the same time. *If you need more help on setting this up, I'd be glad to help*
4. On the PC, using either Streamlabs OBS or OBS Studio, you would add the incoming RTMP signal as a Media Source. This will enable a sound meter for that particular source (all audio captured by the phone will be on one meter though, not sure if that's a downside for you) which you can at least see when your audio peaks and whatnot.
5. From within the PC's OBS, you can either stream to a multistream platform like [Restream.io](https://restream.io/) to stream to multiple sources or to Facebook/YouTube/Mixer what have you.

To address some concerns early on:

- The Wifi capabilities on the S8 are wide enough that you can still stream at a 3,500 kb/s bitrate and still have plenty of bandwidth to make a Zoom call. I personally stream to my PC at 8000 kbps for 1080P 60 fps (*which is overkill but I record the video separately from the stream and want the higher quality*) and OBS has no problem maintaining it's 6000 kb/s upload bitrate to Twitch.
- In order to avoid latency issues with the broadcasted stream itself (the one from the PC) it would be ideal that the PC is connected by LAN cable. As long as the phone is on the Wifi that is the same network (same router for wifi and LAN), you can pick up the broadcast from the phone and broadcast out to the WWW without bottlenecking either connection (*unless your internet upload speed is below 8Mbps then I can't speak on that*)
- If both PC and S8 use wifi then depending on your Wifi card you may run into latency issues when making Zoom calls. It would, at that point, require you have a Wireless adapter capable of gigabit speeds (and why I understand the desire for USB)
- This is only suggested because even if there is a delay that builds over time (200ms network cache if using VLC source instead of media source which only lets you go down to 1mb cache ~ meaning about every 30-60 minutes roughly a second of delay would be added to what is shown on the PC vs what you did) since you're not combining any imagery from the PC, then the audio/video will still be in sync and really would only affect how quickly you can respond to chat.
- Since Zoom is performed on the phone still, there shouldn't be delay between your interaction with whoever you're calling and yourself. However, you would need to change the phone's Streamlabs scene to ONLY be a screen capture without your camera (to avoid conflicting use of the camera with Zoom) and then the camera image will be the one you would see of yourself when making a Zoom call rather than being captured directly on it's own (meaning, lower quality image because it's using what Zoom shows on-screen)
- However, if you wanted a USB connecting app because you wanted to utilize the PC for making a Zoom web conference call and were thinking the PC won't recognize a wifi video feed as a webcam then this can be easily solved by variuos apps (i.e. [Droidcam Client,](https://www.dev47apps.com/droidcam/windows/) [webcamXp](http://www.webcamxp.com/home.aspx), [EpochCam](https://www.kinoni.com/), etc. which will emulate a wireless camera video feed a being a USB webcam)
- With this method, you would lose the audio visual sync if you attempted to plug the Zoom H6 to the PC instead of the S8

Finally

- As an alternative to running a private Nginx RTMP server, you could use Samsung's Flow app which lets you connect the S8 to a Windows 10 PC and screen/audio share. It offers the option of choosing to connect to the phone either through USB or Wifi connection.
- If you don't have Windows 10, the older alternate form of the app is called SideSync. Aside from lower processing when using Samsung Flow (as in, from the phone it takes less work to mirror the image thanks to various Windows 10 functions), the only other difference is that SideSync lets you disable the phone's screen altogether to reduce processing power whereas Flow only allows you to dim the phone screen when mirroring
- In both cases (Samsung Flow or Samsung SideSync) you would need the software installed on the PC and the android app installed on the phone. But this is significantly easier to set up than a persona nginx server.
- Downside (or caveat) is that It can be tricky to get the actual mirrored image that is showing on your PC to be added into OBS or streaming software. You would need to have one or the other disable hardware acceleration or capture the entire display within OBS to have it display properly. (If you try to add it as a window capture it may appear as just a black screen on OBS)

I might be able to offer a better suggestion with a deeper understanding of how you're running into issues now such as:

How are you connecting the Zoom H6 to the S8 now? Through the stereo jack or through USB? Because if you were originally looking for a USB solution for android, was that just to supplement the webcam image while then connecting the Zoom H6 to your pc directly as a result?

What program/app are you currently using to stream to Facebook/YouTube from the phone? The proprietary app for each platform or a third party software?

---

[
![User avatar](https://styles.redditmedia.com/t5_1iaufa/styles/profileIcon_snoo910a2fd2-ece8-45f7-bca6-5d48a313dc12-headshot.png?width=256&height=256&crop=256:256,smart&s=84568c0f4c9652cfe23fe517eae895c25ef9d621)](https://www.reddit.com/user/chi11estpanda/)

level 3

[chi11estpanda](https://www.reddit.com/user/chi11estpanda/)·[1y](https://www.reddit.com/r/Twitch/comments/g2zmjq/best_way_to_use_android_phone_as_webcam_on_pc/fns4zhe/?utm_source=reddit&utm_medium=web2x&context=3)

To capture the camera (and previously without any overlays), I am using the the [Streamlabs OBS for Android](https://play.google.com/store/apps/details?id=com.streamlabs) as previously mentioned and having the destination stream assigned to a "Custom RTMP server" which connects with a personal Nginx RTMP server running on my computer. Although I say "server," it's really just a program (or technically a "Windows Service") that can run on a regular PC in the background to accept the video feed being sent out from the phone.

Unfortunately though, perhaps in the last year or so, the newer versions of the app now add a watermark in a corner of the screen you select. Whereas previously, I had used the app for an entire year without said watermark (as I suppose popularity of its use grew and they had to monetize their app and thereby created a "premium subscription" service.

However, there are alternative apps that will perform the same task without a watermark in terms of broadcasting a clean camera image to a custom RTMP server. The one I know of is [MOZA Genie](https://play.google.com/store/apps/details?id=com.gudsen.genie), although it's the camera app for my gimbal, you can still use its camera function to stream a live feed of the camera to a custom rtmp server address.

~*At this point I stopped to find you alternatives and took a look at* [*obs.ninja*](https://obs.ninja/)*, the reason i note this will be more obvious in a moment~*

However, you can forget all that as I just took a look at [u/KuhjaKnight](https://www.reddit.com/u/KuhjaKnight/)'s suggestion of using [obs.ninja](https://obs.ninja/) and I have to say I'm still in awe of how this works right now but the latency on it is incredible. It's almost unbelievable until i literally just tried it myself. It's super simple and it will provide you with the clean camera feed as you requested. During my initial testing, the bandwidth usage is minimal so it's almost unbelievable to see the reaction time I was getting both from a PC and from a mobile phone. I'm literally about to go test more various applications of it because it appears it's only been recently developed further in the last month or so.

In any case, check it out. I'm super excited about what we just discovered here. Thank you for sharing that [u/KuhjaKnight](https://www.reddit.com/u/KuhjaKnight/)!