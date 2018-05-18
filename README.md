## What is ssh-watcher:

Simple background shell script that watches for ssh login and logout and alerts you via xmessage. <br>
Soon will also watch for failed login attemps. <br>

<br>

## How it works:

Ssh watcher simply watches your `/var/log/auth.log`. <br>
It's desined and tested on raspberry pi, but may be able to run on other os's. <br>
You can also make this automatically run on start up. <br>

<br>

## How to install:

Just put the whatever directory you like, probability best in you home directory, <br>
then run it! `./ssh-watcher.sh` <br>
If you don't want your terminal to be busy running it, then do `./ssh-watcher.sh &`. <br>

<br>

**note:** You can find older versions in the `previous-versions` folder. <br>

## ChangeLog:

### --version-1.1-- May 16, 2018

name change and better layout <br>
<br>

### --version-1.0-- May 11, 2018

initial release <br>

<br>

