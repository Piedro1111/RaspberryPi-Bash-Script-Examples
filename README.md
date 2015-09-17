# RaspberryPi [Bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) Script Examples
Bash Script Examples writing for [Raspbian OS](https://www.raspbian.org/)

![Raspberry Pi image](https://www.raspberrypi.org/wp-content/uploads/2015/01/Pi2ModB1GB_-comp.jpeg)
Image: _Raspberry Pi 2 Model B 1GB_

## Attached scripts
* blink.sh - blinking LED (On/Off [GPIO](https://en.wikipedia.org/wiki/General-purpose_input/output))
* colormusic.sh - blink 7 LED one after the other
* colormusic2.sh - LED gradual lighting up and then gradually turning off
* ifonline.sh - Check external server status by URL (LED blink / led Off = server is off line; LED lighting = server is online)
* semafor.sh - Switch On/Off LED like as semafor
* switch.sh - Switch On/Off GPIO when you write GPIO ID

## Requirements
* RaspberryPi [GPIO](https://en.wikipedia.org/wiki/General-purpose_input/output) library
* [Raspbian OS](https://www.raspbian.org/) Wheezy
* [Bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) support
* [GPIO](https://en.wikipedia.org/wiki/General-purpose_input/output) 13 must be input! 

## Install
1. Copy files from `/example/` in to path `home/user/` _(in [Raspbian OS](https://www.raspbian.org/))_
2. And open it in terminal as sudo user

## Run in [Raspbian OS](https://www.raspbian.org/) bash terminal
1. Open terminal _(CTRL+T or CTRL+ALT+F1)_
2. Write command in terminal like this `sudo ./blink.sh`
3. Add [GPIO](https://en.wikipedia.org/wiki/General-purpose_input/output) ID when your script asks a question

![Raspberry Pi ssh terminal window](http://www.opensencillo.com/wp-content/uploads/2015/09/Snímka-obrazovky-z-2015-09-16-210049.png)

Image: _SSH Putty_

4. When answer all start up questions, script will be run

![Raspbian script](http://www.opensencillo.com/wp-content/uploads/2015/09/Snímka-obrazovky-z-2015-09-16-210058.png)

Image: _Raspberry Pi started bash script_

## End script
* Some scripts end automaticaly but you can cancel running script by _CTRL+C_.

Have fun
