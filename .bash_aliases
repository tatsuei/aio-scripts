# Changing directory aliases
alias exanime='cd /mnt/exd/exAnime'
alias exmusic='cd /mnt/exd/exMusic'
alias mani='cd /mnt/exd/exMusic/musicANI; dir'
alias manitree='cd /mnt/exd/exMusic/musicANI; tree -d'
alias mcn='cd /mnt/exd/exMusic/musicCN; dir'
alias mcntree='cd /mnt/exd/exMusic/musicCN; tree -d'
alias men='cd /mnt/exd/exMusic/musicEN; dir'
alias mentree='cd /mnt/exd/exMusic/musicEN; tree -d'
alias mjp='cd /mnt/exd/exMusic/musicJP; dir'
alias mjptree='cd /mnt/exd/exMusic/musicJP; tree -d'
alias mkr='cd /mnt/exd/exMusic/musicKR; dir'
alias mkrtree='cd /mnt/exd/exMusic/musicKR; tree -d'
alias medm='cd /mnt/exd/exMusic/musicEDM; dir'
alias medmtree='cd /mnt/exd/exMusic/musicEDM; tree -d'
alias mguitar='cd /mnt/exd/exMusic/musicGUITAR; dir'
alias mguitartree='cd /mnt/exd/exMusic/musicGUITAR; tree -d'
alias most='cd /mnt/exd/exMusic/musicOST; dir'
alias mosttree='cd /mnt/exd/exMusic/musicOST; tree -d'
alias calswebsite='cd ~/projects/tatsuei.github.io; dir'
alias calstutorials='cd ~/projects/tutorials; dir'
alias dzrdl='cd ~/DOWNLOADS; dir'
alias terminalaliases='cd ~/terminal-aliases; dir'

# Sync files/folders aliases
alias brcsync='rsync ~/.bashrc ~/projects/tutorials/ && rsync ~/.bash_aliases ~/projects/tutorials/; dir -A ~/projects/tutorials/' 

# Browser aliases
alias akmatfarm='open https://docs.google.com/spreadsheets/d/12X0uBQaN7MuuMWWDTiUjIni_MOP015GnulggmBJgBaQ/edit#gid=485742288'
alias whatsapp='open https://web.whatsapp.com'

# Rclone aliases
alias msakae='fusermount -u /home/tatsuei/sakae; rclone mount sakae-crypt: /home/tatsuei/sakae'
alias usakae='fusermount -u /home/tatsuei/sakae'
alias rcloneui='rclone rcd --rc-web-gui --rc-user=eiji --rc-pass=koukeneiji --rc-serve &'

# Meme aliases
alias doge='cat lectures-folder/doge.lecture'
alias pepe='cat lectures-folder/pepe.lecture'
alias cutepika='cat lectures-folder/cutepikachu.lecture'
alias shockpika='cat lectures-folder/shockedpikachu.lecture'
alias gyoubu='cat lectures-folder/gyoubu.lecture'
alias gnomed='cat lectures-folder/gnomed.lecture'
alias gotem='cat lectures-folder/gotem.lecture'
alias padoru='cat lectures-folder/padoru.lecture'
alias saitama='cat lectures-folder/saitama.lecture'
alias unoreverse='cat lectures-folder/unoreverse.lecture'

# Variety Wallpaper aliases
alias night='variety --set=/home/tatsuei/Pictures/4chan-walls/shaonv.png --pause'
alias day='variety -n' 
alias dark='variety --set=/home/tatsuei/Pictures/4chan-walls/sunset-apartment.jpg --pause'
alias vres='variety --resume'
alias vpau='variety --pause'

# Audacious aliases
alias single='~/terminal-aliases/single.sh'
alias repeat='~/terminal-aliases/repeatall.sh'
alias repeatoff='~/repeatoff.sh'

# Rhythmbox aliases
alias play='rhythmbox-client --play'
alias pause='rhythmbox-client --pause'
alias stop='rhythmbox-client --stop'
alias rate='~/terminal-aliases/ratemusic.sh' # Enter this followed by a rating of 0-5!
alias qrb='rhythmbox-client --quit'
alias np='~/rhythmbox-np/now-playing.sh'
alias whatplay='rhythmbox-client --print-playing'

# App aliases
alias sm='~/SMLoadr-linux-x64'
alias trackma='trackma-gtk &; clear'
alias yt='youtube-dl'
alias yuna='yuna.AppImage &'
alias scrcpywireless='sudo adb start-server; adb connect 192.168.0.164:5555; scrcpy --window-borderless -S &'
alias scrcpywired='sudo adb start-server; scrcpy --window-borderless -S &'
alias buexjese='bundle exec jekyll serve'

# Watch aliases
alias wnp='watch -n30 ~/rhythmbox-np/now-playing.sh'
alias wrbnp='watch -n600 rsync ~/rhythmbox-np/now-playing.csv ~/rhythmbox-np/now-playing.txt ~/projects/rhythmbox-np/'
alias wcprb='watch -n60 ~/rhythmbox-np/cproc-rb.sh'

# Misc Ubuntu Terminal aliases
alias k9='kill -9'
alias k9all='kill -9 $( jobs -p )' 
alias gjob='jobs -l'
alias swup='sudo apt update && sudo apt upgrade -y'
alias db64='~/terminal-aliases/decode-base64-script.sh'
alias db642='~/terminal-aliases/decode-base64twice-script.sh'
alias brc='. ~/.bashrc'
alias debins='~/terminal-aliases/install-ubuntu-deb.sh'
alias open='xdg-open'
alias ba='gedit ~/.bash_aliases &'
alias ge='gedit &'
alias typora='typora &'
