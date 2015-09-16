# RaspberryPi Bash Script Examples
Bash Script Examples writing for Raspbian

![Raspberry Pi image](https://www.raspberrypi.org/wp-content/uploads/2015/01/Pi2ModB1GB_-comp.jpeg)
Image: _Raspberry Pi Model B 1GB_

## Requirements
* RaspberryPi GPIO library
* Raspbian Wheezy
* Bash support
* GPIO 13 must be input! 

## Install
1. Copy files from `/example/` in to path `home/user/` _(in Raspbian OS)_
2. And open it in terminal as sudo user

## Run in Raspbian bash terminal
1. Open terminal _(CTRL+T or CTRL+ALT+F1)_
2. Write command in terminal like this `sudo ./blink.sh`
3. Add GPIO ID when your script asks a question
![Raspberry Pi ssh terminal window](http://www.opensencillo.com/wp-content/uploads/2015/09/Snímka-obrazovky-z-2015-09-16-210049.png)
Image: _SSH Putty_

4. When answer all start up questions, script will be run
![Raspbian script](http://www.opensencillo.com/wp-content/uploads/2015/09/Snímka-obrazovky-z-2015-09-16-210058.png)
Image: _Raspberry Pi started bash script_

## End script
* Some scripts end automaticaly but you can cancel running script by _CTRL+C_.

Have fun
