#!/bin/bash

# https://github.com/WestleyK/ssh-watcher
# created by Westley
# email westley@sylabs.io
# date code created 1806
# updated on 1819
# updaded date May 11, 2018
# version 1.0



run=$( ps aux | grep ssh_watcher.sh | wc -l )
if [[ $run -ge "4" ]]; then
	exit
fi

reset=0

check_login=$( cat /var/log/auth.log | grep -a New | wc -l )
check_logout=$( cat /var/log/auth.log | grep -a Removed | wc -l )


c_login=$check_login
c_logout=$check_logout


while true; do

	check_login=$( cat /var/log/auth.log | grep -a New | wc -l )
	check_logout=$( cat /var/log/auth.log | grep -a Removed | wc -l )
	
	if [[ $reset == "10" ]]; then
		c_login=$check_login
		c_logout=$check_logout
		reset=0
	fi


	sleep 5s

	let "n_login = $check_login - $c_login"
	let "n_logout = $check_logout - $c_logout"
	
	if [[ $n_login -ge "1" ]]; then
		reset=1
	fi

	if [[ $n_logout -ge "1" ]]; then
		reset=2
	fi



	if [[ $reset == "1" ]]; then
		xmessage "someone just ssh your divice, you should do somthing!" &> /dev/null
		reset=10
	fi

	if [[ $reset == "2" ]]; then
		xmessage "someone just stoped ssh-ing you device, you must be safe now." &> /dev/null
		reset=10
	fi


done

