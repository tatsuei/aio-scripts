[toc]

# Customisation

## Firefox

### Changing the `Ctrl+F` (Finder) highlighting colour

1. Open Firefox.
2. In the URL (address) bar, type `about:config` and press the `Enter` key.
3. A warning message would turn up, ***Proceed with Caution***. Press the `Accept the Risk and Continue` button. 
4. In the search bar that turns up in the new page, type `ui.textSelectBackgroundAttention`.
5. Change the default value type by clicking on the radio box labelled `String`. 
6. Then click on the `+` button on the right hand side to input a HEX colour code (include the `#` symbol prefix).
7. That's it! Close the `about:config` page, and try out `Ctrl+F`. Your chosen colour should be displayed now :D

### Tutorial for creating userChrome styles for Firefox

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



### Minimal Firefox userChrome style

[Minimal Functional Fox](https://github.com/mut-ex/minimal-functional-fox) or [Minimal Functional Fox (Fork)](https://github.com/tatsuei/minimal-functional-fox)