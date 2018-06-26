#!/bin/bash

# https://github.com/WestleyK/ssh-watcher
# created by: Westley K
# email: westley@sylabs.io
# date created: February 2, 2018
# updaded date: Jun 25, 2018
# version-1.4


# check if the script is running
run=$( ps aux | grep ssh-watcher-gui-v1.4.sh | wc -l )
if [[ $run -ge "4" ]]; then
	exit
fi

reset=0

check_login=$( cat /var/log/auth.log | grep -a New | wc -l )
check_logout=$( cat /var/log/auth.log | grep -a Removed | wc -l )
check_failed=$( cat /var/log/auth.log | grep -a authentication\ failure | wc -l )

c_login=$check_login
c_logout=$check_logout
c_failed=$check_failed

while true; do
	# kinda a silly way of doing this, but it works :)
	check_login=$( cat /var/log/auth.log | grep -a New | wc -l )
	check_logout=$( cat /var/log/auth.log | grep -a Removed | wc -l )
	check_failed=$( cat /var/log/auth.log | grep -a authentication\ failure | wc -l )
	
	if [[ $reset == "10" ]]; then
		c_login=$check_login
		c_logout=$check_logout
		c_failed=$check_failed
		reset=0
	fi

	# check the log every 5 seconds
	sleep 5s

	let "n_login = $check_login - $c_login"
	let "n_logout = $check_logout - $c_logout"
	let "n_failed = $check_failed - $c_failed"
	
	if [[ $n_login -ge "1" ]]; then
		reset=1
	fi
	if [[ $n_logout -ge "1" ]]; then
		reset=2
	fi
	if [[ $n_failed -ge "1" ]]; then
		reset=3
	fi

	
	# you can modify this to do somthing if someone ssh your divice
	if [[ $reset == "1" ]]; then
		hack_ip=$( cat /var/log/auth.log | tail | grep -a pi\ from | tail -1 | sed 's/.*from //' | cut -f1 -d" " )
		echo -e "Someone just ssh your divice, you should do somthing! \nthere ip address:$hack_ip" | xmessage -center -file - &> /dev/null
		# your command here
		reset=10
	fi

	if [[ $reset == "2" ]]; then
		hack_ip=$( cat /var/log/auth.log | tail | grep -a pi\ from | tail -1 | sed 's/.*from //' | cut -f1 -d" " )
		echo -e "Someone just stoped ssh-ing you device, you must be safe now, \nthere ip address:$hack_ip" | xmessage -center -file - &> /dev/null
		# your command here
		reset=10
	fi

	if [[ $reset == "3" ]]; then 
		hack_ip=$( cat /var/log/auth.log | tail | grep -a pi\ from | tail -1 | sed 's/.*from //' | cut -f1 -d" " )
		echo -e "Someone is trying to login to your device, \nthere ip address:$hack_ip" | xmessage -center -file - &> /dev/null
		# your command here
		reset=10

	fi


done

