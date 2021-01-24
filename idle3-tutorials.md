# IDLE3 Tutorials

## Adding a horizontal scrollbar

1. Make a backup of 'editor.py' which is found in your Python installation dir. Mine is `/usr/lib/python3.8/idlelib/editor.py`.

2. Type this into the terminal: 

   `sudo gedit /python/installation/dir/editor.py`

3. Find this line:

   `self.vbar = vbar = Scrollbar(text_frame, name='vbar')`

4. Add this line:

   `self.hbar = hbar = Scrollbar(text_frame, name='hbar', orient=HORIZONTAL)`

5. Next, find this line and everything after it: 

   `vbar['command'] = self.handle_yview`

6. And add these lines after (5):

   `hbar['command'] = self.handle_xview`
   `hbar.grid(row=2, column=1, sticky=NSEW)`
   `text['xscrollcommand'] = hbar.set`

7. Done! Now restart IDLE and you should find a horizontal scrollbar!