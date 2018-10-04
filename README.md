## What is ssh-watcher:

A simple background shell script that watches for ssh activities and alerts you via xmessage. <br>
Activities includes: ssh login, logout, and failed login attemps. <br>

<br>

## How it works:

Ssh watcher simply watches your `/var/log/auth.log`. <br>
It's desined and tested on raspberry pi, but may be able to run on other OSs. <br>

You can also make this automatically run on start up
[for raspberry pi](#to-make-it-run-on-boot-or-startup-for-raspberry-pi). <br>
<br>


## How to install and use the gui script:

Just put the `ssh-watcher-gui-vX.X.sh` in whichever directory you like, probably best in your home directory, <br>
and then run it! `./ssh-watcher-gui-vX.X.sh` <br>
If you don't want your terminal to be busy running it, then do `./ssh-watcher-gui-vX.X.sh &`. <br>
<br>


## How to install and use the cli script:

Put the `ssh-watcher-cli-vX.X.sh` in your home directory, or wherever you like. <br>
To run it, you can do `./ssh-watcher-cli-vX.X.sh`, and you can do `./ssh-watcher-cli-vX.X.sh -h` for more options. <br>
<br>


## Cli vs Gui:

There are two difrent scripts, the `ssh-watcher-gui-vX.X.sh` if for a raspberry pi with a GUI and display, <br>
and the `ssh-watcher-cli-vX.X.sh` is for a raspberry pi without a GUI or display. <br>
<br>
**Note:** the gui script alerts via xmessage, and the cli script alerts thrught the terminal that's running it. <br>
<br>


## To make it run on boot or startup for raspberry pi: 

Open a terminal and type: <br>
`vim ~/.bashrc` <br>

Then at the top, or the bottom, write: <br>
`./ssh-watcher.sh &> /dev/null &` <br>

save and exit, then you done! <br>
Make sure you script is in your home directory, or include a path to it. <br>
This should work for the latest version of Raspbian. <br>

<br>

---

**note:** You can find older versions in the `previous-versions` folder. <br>

## ChangeLog:

### --version-1.2-- May 18, 2018

now watches for failed login attemps <br>
<br>

### --version-1.1-- May 16, 2018

name change and better layout <br>
<br>

### --version-1.0-- May 11, 2018

initial release <br>
<br>


## End ChangeLog

<br>
