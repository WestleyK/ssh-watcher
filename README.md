## What is ssh-watcher:

A simple background shell script that watches for ssh activities and alerts you via xmessage. <br>
Activities includes: ssh login, logout and failed login attemps. <br>

<br>

## How it works:

Ssh watcher simply watches your `/var/log/auth.log`. <br>
It's desined and tested on raspberry pi, but may be able to run on other os's. <br>

You can also make this automatically run on start up,
[for raspberry pi](#to-make-it-run-on-boot-or-startup-for-raspberry-pi). <br>

<br>

## How to install:

Just put the `ssh-watcher.sh` in whatever directory you like, probability best in you home directory, <br>
then run it! `./ssh-watcher.sh` <br>
If you don't want your terminal to be busy running it, then do `./ssh-watcher.sh &`. <br>
<br>

### To make it run on boot or startup for raspberry pi: 

open a terminal and type: <br>
`vim ~/.bashrc` <br>

then at the top, or the bottom, write: <br>
`./ssh-watcher.sh &> /dev/null &` <br>

save and exit then you done! <br>
Make sure you script is in your home directory, or include a path to it. <br>
this should work for the latest version of Raspbian. <br>

<br>

---

**note:** You can find older versions in the `previous-versions` folder. <br>

## ChangeLog:

### --version-1.2-- May 18, 2018

now watches for failed login attemps <br>


### --version-1.1-- May 16, 2018

name change and better layout <br>


### --version-1.0-- May 11, 2018

initial release <br>


<br>

## End ChangeLog

<br>
