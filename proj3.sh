#!/bin/sh

#function for operatinfg system info
func1 () {
	echo "--------------------------------------------------------------"
	echo "System Information"
	echo "--------------------------------------------------------------"
	echo "Operating System: $(uname -o)"
	/usr/bin/lsb_release -a
}

#function for hostname and DNS Info
func2 () {
	echo "-------------------------------------------------------------"
	echo "Hostname and DNS information"
	echo "-------------------------------------------------------------"
	echo "Hostname : $(hostname | sed 's;\..*;;g') "
	echo "DNS domain : $(hostname | sed 's;.*[\.];;') "
	echo "Fully qualified domain name : $(hostname)"
	echo "Network address (IP) : $(hostname -i | sed 's;.* ;;') "
	echo "DNS name servers (DNS IP) : "
	
}

#function for network info
func3 () {
	echo "--------------------------------------------------------------"
	echo "Network Information"
	echo "--------------------------------------------------------------"
	echo "Total network interfaces found : 1"
	echo "*** IP Adresses Information ***"
	ip addr show
	echo "*******************************"
	echo "*******Network Routing*********"
	echo "*******************************"
	netstat -r
	echo "********************************"
	echo "*****Interface traffic Info*****"
	echo "********************************"
	netstat -i	
}

#function for who is online
func4 () {
	echo "---------------------------------------------------------------"
	echo "Who is online"
	echo "---------------------------------------------------------------"
	who -H
}

#function for last logged in user
func5 () {
	echo "--------------------------------------------------------------"
	echo "List of last logged in users"
	echo "--------------------------------------------------------------"
	last -n 1
}

#function for my IP address
func6 () {
	echo "---------------------------------------------------------------"
	echo "Public IP Information"
	echo "---------------------------------------------------------------"
	dig +short myip.opendns.com @resolver1.opendns.com
}

#function for my disk usage
func7 () {
	echo "---------------------------------------------------------------"
	echo "Disk Usage Info"
	echo "---------------------------------------------------------------"
	df --output=pcent,source
}

#function for file tree
func8 () {
	echo "File tree saved in filetree.html"
	./proj1.sh nothing filetree.html
}

#Main loop for implementation
while true;
do

echo "-------------------------------------------------------"
echo "Main Menu"
echo "-------------------------------------------------------"
echo "1. Operating System Info"
echo "2. Hostname and DNS Info"
echo "3. Network Info"
echo "4. Who is online"
echo "5. Last logged in users"
echo "6. My IP Address"
echo "7. My disk usage"
echo "8. My home file-tree"
echo "9. Process Operations"
echo "10. Exit"

read -p "Enter your choice [ 1 - 10 ] " choice

if [ $choice == 1 ]
then
	func1
elif [ $choice == 2 ]
then
	func2
elif [ $choice == 3 ]
then
	func3
elif [ $choice == 4 ]
then
	func4
elif [ $choice == 5 ]
then
	func5
elif [ $choice == 6 ]
then
	func6
elif [ $choice == 7 ]
then
	func7
elif [ $choice == 8 ]
then
	func8
elif [ $choice == 9 ]
then
	echo "Did not implement Process Operations"
elif [ $choice == 10 ]
then
	break
fi

read -p "Press [Enter] key to continue..." enter

done

