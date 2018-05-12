## What is ssh-watcher:

simple background shell script that watches for ssh login and logout and alerts you via xmessage. <br>
soon will also watch for failed login attemps. <br>

<br>

## How it works:

ssh watcher simply watches your "/var/log/auth.log". <br>
it's desined and tested on raspberry pi, but may be able to run on other os's. <br>
you can also make this automatically run on start up. <br>

<br>

## How to install:

just put the whatever directory you like, probability best in you home directory. <br>
then run it! `./ssh-watcher.sh` <br>

<br>

